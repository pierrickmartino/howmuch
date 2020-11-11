import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';

class NewCategorieInput extends StatefulWidget {
  const NewCategorieInput({
    Key key,
  }) : super(key: key);

  @override
  _NewCategorieInputState createState() => _NewCategorieInputState();
}

class _NewCategorieInputState extends State<NewCategorieInput> {
  DateTime newCategorieDate;
  Tag selectedTag;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildTextField(context),
          _buildTagSelector(context),
          _buildDateButton(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Categorie Name'),
        onSubmitted: (inputName) {
          final dao = Provider.of<CategorieDao>(context, listen: false);
          final categorie = CategoriesCompanion(
            description: Value(inputName),
            code: Value(inputName), // TODO
            creationDate: Value(newCategorieDate),
            tagName: Value(selectedTag?.name),
          );
          dao.insertCategorie(categorie);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  StreamBuilder<List<Tag>> _buildTagSelector(BuildContext context) {
    return StreamBuilder<List<Tag>>(
      stream: Provider.of<TagDao>(context).watchTags(),
      builder: (context, snapshot) {
        final tags = snapshot.data ?? List();

        DropdownMenuItem<Tag> dropdownFromTag(Tag tag) {
          return DropdownMenuItem(
            value: tag,
            child: Row(
              children: <Widget>[
                Text(tag.name),
                SizedBox(width: 5),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(tag.color),
                  ),
                ),
              ],
            ),
          );
        }

        final dropdownMenuItems =
            tags.map((tag) => dropdownFromTag(tag)).toList()
              // Add a "no tag" item as the first element of the list
              ..insert(
                0,
                DropdownMenuItem(
                  value: null,
                  child: Text('No Tag'),
                ),
              );

        return Expanded(
          child: DropdownButton(
            onChanged: (Tag tag) {
              setState(() {
                selectedTag = tag;
              });
            },
            isExpanded: true,
            value: selectedTag,
            items: dropdownMenuItems,
          ),
        );
      },
    );
  }

  IconButton _buildDateButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () async {
        newCategorieDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2050),
        );
      },
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      newCategorieDate = null;
      selectedTag = null;
      controller.clear();
    });
  }
}
