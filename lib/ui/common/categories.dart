import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'add_category_dialog.dart';
import 'edit_category_dialog.dart';
import '../chart/example_bar_chart.dart';
import '../../src/api/category_api.dart';
import '../../src/utils/category_utils_graphql.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Query(
        options: QueryOptions(
            documentNode: gql(findCategoriesQuery), pollInterval: 1),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Scaffold(
            key: _scaffoldKey,
            body: Container(
              color: Colors.grey[200],
              child: FluidLayout(
                child: Builder(
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: FluidLayout.of(context).horizontalPadding),
                      child: Column(
                        children: <Widget>[
                          Fluid(
                              child: Container(
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text(
                                  'Categories',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AddCategoryDialog(
                                              contextParent: context,
                                            ));
                                  },
                                  tooltip: 'New category',
                                  icon: Icon(LineAwesomeIcons.plus),
                                )
                              ],
                            ),
                          )),
                          SizedBox(height: 24),
                          Container(
                            height: 180,
                            child: ListView.separated(
                              itemCount: 2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: FluidLayout.of(context)
                                          .horizontalPadding +
                                      FluidLayout.of(context).fluidPadding),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  ExempleBarChart(),
                              separatorBuilder: (_, __) => SizedBox(
                                  width: FluidLayout.of(context)
                                      .horizontalPadding),
                            ),
                          ),
                          SizedBox(height: 24),
                          Fluid(
                              child: Container(
                            height: MediaQuery.of(context).size.height - 278,
                            width: double.infinity,
                            child: Center(
                              child: result.hasException
                                  ? Text(result.exception.toString())
                                  : result.loading
                                      ? CircularProgressIndicator()
                                      : CategoryList(
                                          list: result.data["categories"]
                                              ["edges"]),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({@required this.list});

  final list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.list.length,
      itemBuilder: (context, index) {
        final category = this.list[index];
        return CategoryItem(category: category);
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({@required this.category});

  final category;
  CategoryUtilsGraphQL utils;

  @override
  Widget build(BuildContext context) {
    Color categoryColor;
    IconData categoryIcon;

    if (category["node"]['color'] == null) {
      categoryColor = Colors.grey;
    } else {
      categoryColor = Color(category["node"]['color']).withOpacity(1);
    }

    if (category["node"]['icon'] == null) {
      categoryIcon = LineAwesomeIcons.info_circle;
    } else {
      categoryIcon = IconData(category["node"]['icon'],
          fontFamily: category["node"]['iconfamily'],
          fontPackage: category["node"]['iconpackage']);
    }

    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      movementDuration: const Duration(milliseconds: 100),
      child: Badge(
          position: BadgePosition.topEnd(top: 10, end: 10),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    categoryIcon,
                    size: 26.0,
                    color: categoryColor,
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(category["node"]
                            ['name']) /*, creationDate, lastUpdateDate*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          badgeColor: Colors.red,
          animationType: BadgeAnimationType.scale,
          animationDuration: Duration(milliseconds: 500),
          shape: BadgeShape.circle,
          badgeContent: Text(category["node"]['counter'].toString(),
              style: TextStyle(color: Colors.white))),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: LineAwesomeIcons.edit,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => CategoryEditDialog(
                entry: category,
                contextParent: context,
              ),
            );
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: LineAwesomeIcons.trash,
          onTap: () {
            if (category["node"]['id'].isNotEmpty) {
              utils = CategoryUtilsGraphQL(
                id: category["node"]['id'],
              );

              utils.deleteData().whenComplete(
                  () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Category deleted'),
                        ),
                      ));
            }
          },
        ),
      ],
    );
  }
}
