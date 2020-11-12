import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/blocs/category.dart';
import 'package:intl/intl.dart';

import '../../src/blocs/category.dart';
import '../../src/database/database.dart';

final _dateFormat = DateFormat.yMMMd();

class CategoryEditDialog extends StatefulWidget {
  final Category entry;

  const CategoryEditDialog({Key key, this.entry}) : super(key: key);

  @override
  _CategoryEditDialogState createState() => _CategoryEditDialogState();
}

class _CategoryEditDialogState extends State<CategoryEditDialog> {
  final TextEditingController textController = TextEditingController();
  DateTime _dueDate;

  @override
  void initState() {
    textController.text = widget.entry.description;
    _dueDate = widget.entry.creationDate;
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formattedDate = 'No date set';
    if (_dueDate != null) {
      formattedDate = _dateFormat.format(_dueDate);
    }

    return AlertDialog(
      title: const Text('Edit entry'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: 'What needs to be done?',
              helperText: 'Content of entry',
            ),
          ),
          Row(
            children: <Widget>[
              Text(formattedDate),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final now = DateTime.now();
                  final initialDate = _dueDate ?? now;
                  final firstDate =
                      initialDate.isBefore(now) ? initialDate : now;

                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: firstDate,
                    lastDate: DateTime(3000),
                  );

                  setState(() {
                    if (selectedDate != null) _dueDate = selectedDate;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        FlatButton(
          child: const Text('Cancel'),
          textColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('Save'),
          onPressed: () {
            final updatedContent = textController.text;
            final entry = widget.entry.copyWith(
              description: updatedContent.isNotEmpty ? updatedContent : null,
              creationDate: _dueDate,
            );

            BlocProvider.of<HowMuchAppBloc>(context).updateCategory(entry);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
