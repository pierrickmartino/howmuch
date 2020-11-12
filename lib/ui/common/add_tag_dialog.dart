import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/blocs/category.dart';

class AddTagDialog extends StatefulWidget {
  @override
  _AddTagDialogState createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add a tag',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Name of the tag',
              ),
              onSubmitted: (_) => _addEntry(),
            ),
            ButtonBar(
              children: [
                FlatButton(
                  child: const Text('Add'),
                  textColor: Theme.of(context).accentColor,
                  onPressed: _addEntry,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addEntry() {
    if (_controller.text.isNotEmpty) {
      BlocProvider.of<HowMuchAppBloc>(context).addTag(_controller.text);
      Navigator.of(context).pop();
    }
  }
}