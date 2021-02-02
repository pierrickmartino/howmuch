// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../src/bloc/bloc.dart';
// //import '../../src/model/category.dart';

// // UNUSED IN FAKE DATA MODE
// // import '../../src/utils/category_utils_graphql.dart';

// class AddCategoryDialog extends StatelessWidget {
//   final BuildContext contextParent;

//   AddCategoryDialog({Key key, this.contextParent}) : super(key: key);

//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 'Add a category',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//             ),
//             TextField(
//               controller: _controller,
//               autofocus: true,
//               decoration: InputDecoration(
//                 labelText: 'What is the category to create?',
//               ),
//               onSubmitted: (_) => addCategory(context),
//             ),
//             ButtonBar(
//               children: [
//                 FlatButton(
//                   child: const Text('Add'),
//                   textColor: Theme.of(context).accentColor,
//                   onPressed: () {
//                     addCategory(context);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void addCategory(BuildContext context) {
//     if (_controller.text.isNotEmpty) {
//       BlocProvider.of<HowMuchAppBloc>(context).createCategory(_controller.text);

//       //print('add category: ' + category.name);

//       _controller.text = "";
//     }

//     Navigator.of(context).pop();
//   }
// }
