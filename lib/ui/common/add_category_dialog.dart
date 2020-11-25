import 'package:flutter/material.dart';
//import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:howmuch/src/utils/category_utils_graphql.dart';
//import 'package:http/http.dart';

import '../../src/model/category.dart';
//import '../../src/utils/category_utils.dart';

class AddCategoryDialog extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKeyParent;
  final BuildContext contextParent;

  AddCategoryDialog({Key key, this.scaffoldKeyParent, this.contextParent})
      : super(key: key);

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Add a category',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'What is the category to create?',
              ),
              onSubmitted: (_) => addCategory(),
            ),
            ButtonBar(
              children: [
                FlatButton(
                  child: const Text('Add'),
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    addCategory();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addCategory() {
    Category category = Category(name: _controller.text);
    CategoryUtilsGraphQL utils;

    if (category.name.isNotEmpty) {
      utils = CategoryUtilsGraphQL(
        name: category.name,
      );
      utils.sendData().whenComplete(
          () => ScaffoldMessenger.of(widget.contextParent).showSnackBar(
                SnackBar(
                  content: const Text('Category added!'),
                ),
              ));

      _controller.text = "";
    }

    Navigator.of(context).pop();
  }
}
