import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/blocs/category.dart';
import 'package:howmuch/ui/common/category_card.dart';
//import 'package:provider/provider.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:undo/undo.dart';

import '../../src/database/database.dart';
//import '../../widgets/new_categorie_input_widget.dart';
//import '../../widgets/new_tag_input_widget.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HowMuchAppBloc, ChangeStack>(
      builder: (context, cs) => Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        //drawer: TagsDrawer(),
        body: StreamBuilder<List<CategoryWithTag>>(
          stream: bloc.homeScreenEntries,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }

            final activeCategories = snapshot.data;

            return ListView.builder(
              itemCount: activeCategories.length,
              itemBuilder: (context, index) {
                return CategoryCard(activeCategories[index].category);
              },
            );
          },
        ),
        // body: Column(
        //   children: <Widget>[
        //     Expanded(child: _buildCategoryList(context)),
        //     NewCategorieInput(),
        //     NewTagInput(),
        //   ],
        // )
      ),
    );
  }

  // StreamBuilder<List<CategoryWithTag>> _buildCategoryList(
  //     BuildContext context) {
  //   final dao = Provider.of<CategoryDao>(context);
  //   return StreamBuilder(
  //     stream: bloc.homeScreenEntries,
  //     builder: (context, AsyncSnapshot<List<CategoryWithTag>> snapshot) {
  //       final categories = snapshot.data ?? List();

  //       return ListView.builder(
  //         itemCount: categories.length,
  //         itemBuilder: (_, index) {
  //           final item = categories[index];
  //           return _buildListItem(item, dao);
  //         },
  //       );
  //     },
  //   );
  // }

  // Widget _buildListItem(CategoryWithTag item, CategoryDao dao) {
  //   return Slidable(
  //     actionPane: SlidableDrawerActionPane(),
  //     secondaryActions: <Widget>[
  //       IconSlideAction(
  //         caption: 'Delete',
  //         color: Colors.red,
  //         icon: Icons.delete,
  //         onTap: () => dao.deleteCategory(item.category),
  //       )
  //     ],
  //     child: CheckboxListTile(
  //       title: Text(item.category.description),
  //       subtitle: Text(item.category.creationDate?.toString() ?? 'No date'),
  //       secondary: _buildTag(item.tag),
  //       value: item.category.active,
  //       onChanged: (newValue) {
  //         dao.updateCategory(item.category.copyWith(active: newValue));
  //       },
  //     ),
  //   );
  // }

  // Column _buildTag(Tag tag) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       if (tag != null) ...[
  //         Container(
  //           width: 10,
  //           height: 10,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: Color(tag.color),
  //           ),
  //         ),
  //         Text(
  //           tag.name,
  //           style: TextStyle(
  //             color: Colors.black.withOpacity(0.5),
  //           ),
  //         ),
  //       ],
  //     ],
  //   );
  // }
}
