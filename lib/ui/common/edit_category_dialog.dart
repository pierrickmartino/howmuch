import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:howmuch/src/bloc/category.dart';
import 'package:howmuch/src/database/database.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryEditDialog extends StatefulWidget {
  final Category entry;
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
  // color picker
  ColorSwatch _categoryColor, _tempCategoryColor;
  MaterialColor _categoryMaterialColor;
  // icon picker
  Icon _categoryIcon, _icon;
  bool isAdaptive = true, showTooltips = false, showSearch = true;
  int performance = 0;

  @override
  void initState() {
    textController.text = widget.entry.description;
    performance =
        widget.entry.performance ?? 0; // 0 if it's null; otherwise, the integer

    if (widget.entry.color == null) {
      _categoryColor = Colors.grey;
      _categoryMaterialColor = Colors.grey;
    } else {
      Map<int, Color> color = {100: Color(widget.entry.color).withOpacity(1)};
      _categoryMaterialColor = MaterialColor(widget.entry.color, color);
      _categoryColor = _categoryMaterialColor;
    }

    if (widget.entry.icon == null) {
      _categoryIcon = Icon(LineAwesomeIcons.info_circle);
    } else {
      _categoryIcon = Icon(
        IconData(widget.entry.icon,
            fontFamily: widget.entry.iconFamily,
            fontPackage: widget.entry.iconPackage),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _openCategoryIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(context,
        adaptiveDialog: isAdaptive,
        showTooltips: showTooltips,
        showSearchBar: showSearch,
        barrierDismissible: false,
        iconPackMode: IconPack.lineAwesomeIcons);

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
                  child: Text('Cancel'), onPressed: Navigator.of(context).pop),
              FlatButton(
                  child: Text('Save'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() => _categoryColor = _tempCategoryColor);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
                helperText: 'Content of entry'),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text('Color'),
              Spacer(),
              CircleColor(color: _categoryColor, circleSize: 25),
              IconButton(
                  icon: const Icon(LineAwesomeIcons.edit),
                  onPressed: _openCategoryColorPicker),
            ],
          ),
          Row(
            children: [
              Text('Icon'),
              Spacer(),
              _categoryIcon,
              IconButton(
                  icon: const Icon(LineAwesomeIcons.edit),
                  onPressed: _openCategoryIcon),
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
            }),
        FlatButton(
          child: const Text('Save'),
          onPressed: () {
            final updatedContent = textController.text;

            final entry = widget.entry.copyWith(
                description: updatedContent.isNotEmpty ? updatedContent : null,
                color: _categoryColor.value,
                icon: _categoryIcon.icon.codePoint,
                iconFamily: _categoryIcon.icon.fontFamily,
                iconPackage: _categoryIcon.icon.fontPackage,
                performance: performance);

            textController.text = "";

            BlocProvider.of<HowMuchAppBloc>(context).updateCategory(entry);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
