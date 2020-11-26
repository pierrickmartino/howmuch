import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
//import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../src/utils/category_utils_graphql.dart';

// final _dateFormat = DateFormat.yMMMd();

class CategoryEditDialog extends StatefulWidget {
  final entry;
  //final Function() notifyParent;
  final BuildContext contextParent;

  const CategoryEditDialog({Key key, this.entry, this.contextParent})
      : super(key: key);

  @override
  _CategoryEditDialogState createState() => _CategoryEditDialogState();
}

class _CategoryEditDialogState extends State<CategoryEditDialog> {
  // standard field
  final TextEditingController textController = TextEditingController();
  //DateTime _creationDate;
  // color picker
  ColorSwatch _categoryColor;
  MaterialColor _categoryMaterialColor;
  ColorSwatch _tempCategoryColor;
  // icon picker
  Icon _categoryIcon;
  Icon _icon;
  bool isAdaptive = true;
  bool showTooltips = false;
  bool showSearch = true;
  int performance = 0;

  @override
  void initState() {
    textController.text = widget.entry["node"]['name'];
    performance = widget.entry["node"]['performance'] ??
        0; // 0 if it's null; otherwise, the integer
    //_creationDate = widget.entry.creationDate;

    if (widget.entry["node"]['color'] == null) {
      _categoryColor = Colors.grey;
      _categoryMaterialColor = Colors.grey;
    } else {
      Map<int, Color> color = {
        100: Color(widget.entry["node"]['color']).withOpacity(1),
      };
      _categoryMaterialColor =
          MaterialColor(widget.entry["node"]['color'], color);
      _categoryColor = _categoryMaterialColor;
    }

    if (widget.entry["node"]['icon'] == null) {
      _categoryIcon = Icon(LineAwesomeIcons.info_circle);
    } else {
      _categoryIcon = Icon(IconData(widget.entry["node"]['icon'],
          fontFamily: widget.entry["node"]['iconfamily'],
          fontPackage: widget.entry["node"]['iconpackage']));
    }

    super.initState();
  }

  //@override
  // void dispose() {
  //   textController.dispose();
  //   super.dispose();
  // }

  void _openCategoryIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(
      context,
      adaptiveDialog: isAdaptive,
      showTooltips: showTooltips,
      showSearchBar: showSearch,
      barrierDismissible: false,
      iconPackMode: IconPack.lineAwesomeIcons,
    );

    if (icon != null) {
      _icon = Icon(icon);
      setState(() => _categoryIcon = _icon);
    }
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
    //var formattedDate = 'No creation date set';
    // if (_creationDate != null) {
    //   formattedDate = _dateFormat.format(_creationDate);
    // }

    return AlertDialog(
      title: const Text('Edit category'),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
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
          SizedBox(height: 12),
          Row(
            children: [
              Text('Color'),
              Spacer(),
              CircleColor(color: _categoryColor, circleSize: 25),
              IconButton(
                icon: const Icon(LineAwesomeIcons.edit),
                onPressed: _openCategoryColorPicker,
              ),
            ],
          ),
          Row(
            children: [
              Text('Icon'),
              Spacer(),
              _categoryIcon,
              IconButton(
                icon: const Icon(LineAwesomeIcons.edit),
                onPressed: _openCategoryIcon,
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text('Perf.'),
              Spacer(),
              ToggleSwitch(
                initialLabelIndex: performance,
                cornerRadius: 12.0,
                minWidth: 65,
                labels: ['incl.', 'or not'],
                onToggle: (index) {
                  performance = index;
//                  print('switched to: $index');
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
            final entry = widget.entry["node"];
            entry['name'] = updatedContent.isNotEmpty ? updatedContent : null;
            entry['color'] = _categoryColor.value;
            entry['icon'] = _categoryIcon.icon.codePoint;
            entry['iconfamily'] = _categoryIcon.icon.fontFamily;
            entry['iconpackage'] = _categoryIcon.icon.fontPackage;
            entry['performance'] = performance;

            CategoryUtilsGraphQL utils;

            // if (entry["node"]['name'] &&
            //     entry["node"]['color'].toString().isNotEmpty &&
            //     entry.icon.toString().isNotEmpty) {
            utils = CategoryUtilsGraphQL(
                id: entry['id'],
                name: entry['name'],
                color: entry['color'],
                icon: entry['icon'],
                iconfamily: entry['iconfamily'],
                iconpackage: entry['iconpackage'],
                performance: entry['performance'],
                counter: 0);
            utils.updateData().whenComplete(
                () => ScaffoldMessenger.of(widget.contextParent).showSnackBar(
                      SnackBar(
                        content: const Text('Category updated'),
                      ),
                    ));

            textController.text = "";

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
