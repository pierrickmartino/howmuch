import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:undo/undo.dart';

import 'index.dart';
import '../../src/database/database.dart';
import '../../src/blocs/category.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final TextEditingController controller = TextEditingController();
  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HowMuchAppBloc, ChangeStack>(
      builder: (context, cs) => Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          actions: [
            IconButton(
              icon: Icon(Icons.undo),
              onPressed: !bloc.canUndo
                  ? null
                  : () {
                      if (mounted)
                        setState(() {
                          bloc.undo();
                        });
                    },
            ),
            IconButton(
              icon: Icon(Icons.redo),
              onPressed: !bloc.canRedo
                  ? null
                  : () {
                      if (mounted)
                        setState(() {
                          bloc.redo();
                        });
                    },
            ),
          ],
        ),
        drawer: TagsDrawer(),
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
        bottomSheet: Material(
          elevation: 12.0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('What is the category to create?'),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: controller,
                            onSubmitted: (_) => _createCategoryEntry(),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          color: Theme.of(context).accentColor,
                          onPressed: _createCategoryEntry,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createCategoryEntry() {
    if (controller.text.isNotEmpty) {
      // We write the entry here. Notice how we don't have to call setState()
      // or anything - moor will take care of updating the list automatically.
      bloc.createCategory(controller.text);
      controller.clear();
    }
  }
}
