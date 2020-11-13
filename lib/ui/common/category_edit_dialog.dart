import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
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
  DateTime _creationDate;
  ColorSwatch _categoryColor;
  MaterialColor _categoryMaterialColor;
  ColorSwatch _tempCategoryColor;

  @override
  void initState() {
    textController.text = widget.entry.description;
    _creationDate = widget.entry.creationDate;

    if (widget.entry.color == null) {
      _categoryColor = Colors.grey;
      _categoryMaterialColor = Colors.grey;
    } else {
      Map<int, Color> color = {
        100: Color(widget.entry.color).withOpacity(1),
      };
      _categoryMaterialColor = MaterialColor(widget.entry.color, color);
      _categoryColor = _categoryMaterialColor;
    }

    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _openCategoryColorPicker() async {
    _openDialog(
      "Main Color picker",
      MaterialColorPicker(
        colors: fullMaterialColors,
        selectedColor: _categoryColor,
        allowShades: false,
        circleSize: 35.0,
        onMainColorChange: (color) =>
            setState(() => _tempCategoryColor = color),
      ),
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('Cancel'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _categoryColor = _tempCategoryColor);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var formattedDate = 'No creation date set';
    if (_creationDate != null) {
      formattedDate = _dateFormat.format(_creationDate);
    }

    return AlertDialog(
      title: const Text('Edit category'),
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
                  final initialDate = _creationDate ?? now;
                  final firstDate =
                      initialDate.isBefore(now) ? initialDate : now;

                  final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: firstDate,
                      lastDate: DateTime(3000),
                      helpText: 'Creation date');

                  setState(() {
                    if (selectedDate != null) _creationDate = selectedDate;
                  });
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Category color'),
              Spacer(),
              CircleColor(color: _categoryColor, circleSize: 25),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _openCategoryColorPicker,
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
              creationDate: _creationDate,
              color: _categoryColor.value,
            );

            BlocProvider.of<HowMuchAppBloc>(context).updateCategory(entry);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
