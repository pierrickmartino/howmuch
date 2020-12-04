import 'package:badges/badges.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:howmuch/constant/const.dart';
import 'package:howmuch/src/model/category.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'add_category_dialog.dart';
import 'edit_category_dialog.dart';
import '../chart/example_bar_chart.dart';

// UNUSED IN FAKE DATA MODE
// import 'package:graphql_flutter/graphql_flutter.dart';
// import '../../src/api/category_api.dart';
// import '../../src/utils/category_utils_graphql.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  refresh() {
    setState(() {});
  }

  static Faker faker = Faker();
  List<Category> fakeCategoryList = List.generate(
      15,
      (index) => Category(
          id: faker.guid.guid(),
          objectId: faker.guid.guid(),
          name: faker.company.name(),
          color: faker.randomGenerator.integer(4300000000, min: 4200000000),
          icon: faker.randomGenerator.integer(63000, min: 62000),
          iconfamily: 'LineAwesomeIcons',
          iconpackage: 'line_awesome_flutter',
          counter: faker.randomGenerator.integer(99),
          performance: faker.randomGenerator.integer(2)),
      growable: false);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    // Devrait sans doute  être positioné à un autre moment

    // return Query(
    //     options: QueryOptions(documentNode: gql(findCategoriesQuery)),
    //     builder: (QueryResult result,
    //         {VoidCallback refetch, FetchMore fetchMore}) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Color(backgroundColor),
        child: FluidLayout(
          child: Builder(
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 6),
                  Fluid(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(menuBackgroundColor),
                      borderRadius: BorderRadius.all(Radius.circular(
                              5.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(menuBackgroundColor),
                          blurRadius: 10,
                          spreadRadius: 0.01,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(color: Color(menuTextColor)),
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
                          icon: Icon(
                            LineAwesomeIcons.plus,
                            size: 16,
                            color: Color(menuTextColor),
                          ),
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
                          horizontal:
                              FluidLayout.of(context).horizontalPadding +
                                  FluidLayout.of(context).fluidPadding),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ExempleBarChart(),
                      separatorBuilder: (_, __) => SizedBox(
                          width: FluidLayout.of(context).horizontalPadding),
                    ),
                  ),
                  SizedBox(height: 24),
                  Fluid(
                      child: Container(
                    height: MediaQuery.of(context).size.height - 284,
                    width: double.infinity,
                    child: Center(
                      child:
                          //result.hasException ?
                          // Text(result.exception.toString())
                          //: result.loading
                          //    ? CircularProgressIndicator()
                          //:
                          // CategoryList(
                          //     list: result.data["categories"]
                          //         ["edges"]),

                          CategoryList(list: fakeCategoryList),
                    ),
                  )),
                ],
              ),
              //),
            ),
          ),
        ),
      ),
    );
    //});
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
  //CategoryUtilsGraphQL utils;

  @override
  Widget build(BuildContext context) {
    Color categoryColor;
    IconData categoryIcon;
    //Color performanceColor;
    Chip performanceChip;

    String storedCategoryId,
        storedCategoryName,
        storedCategoryIconFamily,
        storedCategoryIconPackage;
    int storedCategoryColor,
        storedCategoryPerformance,
        storedCategoryCounter,
        storedCategoryIcon;

    if (dataMode == 'fake') {
      Category fakeCategory = category;

      storedCategoryId = fakeCategory.id;
      storedCategoryName = fakeCategory.name;
      storedCategoryColor = fakeCategory.color;
      storedCategoryPerformance = fakeCategory.performance;
      storedCategoryCounter = fakeCategory.counter;
      storedCategoryIcon = fakeCategory.icon;
      storedCategoryIconFamily = fakeCategory.iconfamily;
      storedCategoryIconPackage = fakeCategory.iconpackage;
    } else {
      storedCategoryId = category["node"]['id'];
      storedCategoryName = category["node"]['name'];
      storedCategoryColor = category["node"]['color'];
      storedCategoryPerformance = category["node"]['performance'];
      storedCategoryCounter = category["node"]['counter'];
      storedCategoryIcon = category["node"]['icon'];
      storedCategoryIconFamily = category["node"]['iconfamily'];
      storedCategoryIconPackage = category["node"]['iconpackage'];
    }

    if (storedCategoryColor == null) {
      categoryColor = Colors.grey;
    } else {
      categoryColor = Color(storedCategoryColor).withOpacity(1);
    }

    if (storedCategoryIcon == null) {
      categoryIcon = LineAwesomeIcons.info_circle;
    } else {
      categoryIcon = IconData(storedCategoryIcon,
          fontFamily: storedCategoryIconFamily,
          fontPackage: storedCategoryIconPackage);
    }

    if (storedCategoryPerformance == 0) {
      performanceChip = Chip(
          backgroundColor: Color(chipBackgroundColor),
          label: Text('perf. incl.'));
    } else {
      performanceChip = Chip(
        backgroundColor: Color(chipBackgroundColor),
        label: Text(
          'perf. excl.',
        ),
      );
    }

    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      movementDuration: const Duration(milliseconds: 100),
      child: Badge(
          position: BadgePosition.topEnd(top: 10, end: 10),
          child: Card(
            color: Color(cardBackgroundColor),
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
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: context.breakpoint.isLargerThanM
// in case of a big size screen
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text(
                                  storedCategoryName,
                                  style: TextStyle(color: Color(cardTextColor)),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              performanceChip,
                              /*, creationDate, lastUpdateDate*/
                            ],
                          )
// otherwise
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text(
                                  storedCategoryName,
                                  style: TextStyle(color: Color(cardTextColor)),
                                ),
                              ),
                              /*, creationDate, lastUpdateDate*/
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
          badgeColor: const Color(badgeBackgroundColor),
          animationType: BadgeAnimationType.scale,
          animationDuration: Duration(milliseconds: 500),
          shape: BadgeShape.circle,
          badgeContent: Text(storedCategoryCounter.toString(),
              style: TextStyle(color: Color(badgeTextColor)))),
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
            print('delete category: ' + storedCategoryId);

            // if (category["node"]['id'].isNotEmpty) {
            //   utils = CategoryUtilsGraphQL(
            //     id: category["node"]['id'],
            //   );

            // utils
            //     .deleteData()
            //     .whenComplete(() => ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(
            //             content: const Text('Category deleted'),
            //           ),
            //         ));
            //}
          },
        ),
      ],
    );
  }
}
