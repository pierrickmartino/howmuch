//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

//import '../../src/bloc/category.dart';

import '../../src/model/category.dart';
import '../../src/utils/category_utils.dart';

class AddCategoryDialog extends StatefulWidget {
  final Function() notifyParent;

  AddCategoryDialog({Key key, @required this.notifyParent}) : super(key: key);

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
              //onSubmitted: (_) => _addEntry(),
              onSubmitted: (_) => addCategory(context),
            ),
            ButtonBar(
              children: [
                FlatButton(
                  child: const Text('Add'),
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    addCategory(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void _addEntry() {
  //   if (_controller.text.isNotEmpty) {
  //     BlocProvider.of<HowMuchAppBloc>(context).createCategory(_controller.text);
  //     Navigator.of(context).pop();
  //   }
  // }

// void showAddCategoryDialog() {

//     showDialog(context: context,
//       builder: (_) => AlertDialog(
//         content: Container(
//           width: double.maxFinite,
//           child: TextField(
//             controller: _controller,
//             decoration: InputDecoration(
//               labelText: "Enter task",
//             ),
//           ),
//         ),
//         actions: <Widget>[
//           FlatButton(onPressed: () {

//             Navigator.pop(context);
//             addCategory();

//           }, child: Text("Add")),
//           FlatButton(onPressed: () {
//             Navigator.pop(context);
//           }, child: Text("Cancel")),
//         ],
//       )
//     );

//   }

  void addCategory(BuildContext context) {
    // _scaffoldKey.currentState.showSnackBar(SnackBar(content: Row(
    //   children: <Widget>[
    //     Text("Adding category"),
    //     CircularProgressIndicator(),
    //   ],
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    // ),
    //   duration: Duration(minutes: 1),
    // ));

    Category category = Category(name: _controller.text);

    CategoryUtils.addCategory(category).then((res) {
      //_scaffoldKey.currentState.hideCurrentSnackBar();

      Response response = res;
      if (response.statusCode == 201) {
        //Successful
        _controller.text = "";

        //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Category added!"), duration: Duration(seconds: 1),));
        widget.notifyParent();
        // setState(() {
        //   //Update UI
        // });
      }
    });

    Navigator.of(context).pop();
  }
}
