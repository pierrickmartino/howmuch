import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../src/blocs/category.dart';
import '../../src/database/database.dart';
import 'index.dart';

final DateFormat _format = DateFormat.yMd();

/// Card that displays an entry and an icon button to delete that entry
class CategoryCard extends StatelessWidget {
  final Category entry;

  CategoryCard(this.entry) : super(key: ObjectKey(entry.id));

  @override
  Widget build(BuildContext context) {
    Widget creationDate;
    Widget lastUpdateDate;
    Color categoryColor;
    IconData categoryIcon;

    if (entry.creationDate == null) {
      creationDate = GestureDetector(
        onTap: () {
          // BlocProvider.provideBloc(context).db.testTransaction(entry);
        },
        child: const Text(
          'No creation date',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      );
    } else {
      creationDate = Text(
        'created on ' + _format.format(entry.creationDate),
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      );
    }

    if (entry.lastUpdateDate == null) {
      lastUpdateDate = GestureDetector(
        onTap: () {
          // BlocProvider.provideBloc(context).db.testTransaction(entry);
        },
        child: const Text(
          'No update date',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      );
    } else {
      lastUpdateDate = Text(
        'last update on ' + _format.format(entry.lastUpdateDate),
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      );
    }

    if (entry.color == null) {
      categoryColor = Colors.grey;
    } else {
      categoryColor = Color(entry.color).withOpacity(1);
    }

    if (entry.icon == null) {
      categoryIcon = LineAwesomeIcons.info_circle;
    } else {
      categoryIcon = IconData(entry.icon,
          fontFamily: entry.icon_family, fontPackage: entry.icon_package);
    }

    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.25,
      movementDuration: const Duration(milliseconds: 100),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                categoryIcon,
                size: 26.0,
                color: categoryColor,
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(entry.description),
                    creationDate,
                    lastUpdateDate
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: LineAwesomeIcons.edit,
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => CategoryEditDialog(entry: entry),
            );
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: LineAwesomeIcons.trash,
          onTap: () {
            // We delete the entry here. Again, notice how we don't have to call setState() or
            // inform the parent widget. The animated list will take care of this automatically.
            BlocProvider.of<HowMuchAppBloc>(context).deleteCategory(entry);
          },
        ),
      ],
    );
  }
}
