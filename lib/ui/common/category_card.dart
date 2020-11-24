import 'package:flutter/material.dart';
import 'package:howmuch/src/utils/category_utils.dart';
import 'package:http/http.dart';
//import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../src/model/category.dart';
import 'index.dart';

//final DateFormat _format = DateFormat.yMd();

/// Card that displays an entry and an icon button to delete that entry
class CategoryCard extends StatefulWidget {
  final Category entry;
  final Function() notifyParent;

  CategoryCard({this.entry, @required this.notifyParent})
      : super(key: ObjectKey(entry.objectId));

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //Widget creationDate;
    //Widget lastUpdateDate;
    Color categoryColor;
    IconData categoryIcon;

    // if (entry.creationDate == null) {
    // creationDate = GestureDetector(
    //   onTap: () {
    //     // BlocProvider.provideBloc(context).db.testTransaction(entry);
    //   },
    //   child: const Text(
    //     'No creation date',
    //     style: TextStyle(color: Colors.grey, fontSize: 12),
    //   ),
    // );
    //}
    //else {
    //   creationDate = Text(
    //     'created on ' + _format.format(entry.creationDate),
    //     style: const TextStyle(color: Colors.grey, fontSize: 12),
    //   );
    // }

    //if (entry.lastUpdateDate == null) {
    // lastUpdateDate = GestureDetector(
    //   onTap: () {
    //     // BlocProvider.provideBloc(context).db.testTransaction(entry);
    //   },
    //   child: const Text(
    //     'No update date',
    //     style: TextStyle(color: Colors.grey, fontSize: 12),
    //   ),
    // );
    //}
    // else {
    //   lastUpdateDate = Text(
    //     'last update on ' + _format.format(entry.lastUpdateDate),
    //     style: const TextStyle(color: Colors.grey, fontSize: 12),
    //   );
    // }

    if (widget.entry.color == null) {
      categoryColor = Colors.grey;
    } else {
      categoryColor = Color(widget.entry.color).withOpacity(1);
    }

    if (widget.entry.icon == null) {
      categoryIcon = LineAwesomeIcons.info_circle;
    } else {
      categoryIcon = IconData(widget.entry.icon,
          fontFamily: widget.entry.iconfamily,
          fontPackage: widget.entry.iconpackage);
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
                    Text(widget.entry.name) /*, creationDate, lastUpdateDate*/
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
              builder: (ctx) => CategoryEditDialog(
                entry: widget.entry,
                notifyParent: widget.notifyParent,
                contextParent: context,
              ),
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
            deleteCategory(widget.entry.objectId);

            // We delete the entry here. Again, notice how we don't have to call setState() or
            // inform the parent widget. The animated list will take care of this automatically.
            //BlocProvider.of<HowMuchAppBloc>(context).deleteCategory(entry);
          },
        ),
      ],
    );
  }

  void deleteCategory(String objectId) {
    // _scaffoldKey.currentState.showSnackBar(SnackBar(content: Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: <Widget>[
    //     Text("Deleting todo"),
    //     CircularProgressIndicator(),
    //   ],
    // ),
    //   duration: Duration(minutes: 1),
    // ),);

    CategoryUtils.deleteCategory(objectId).then((res) {
      Response response = res;
      if (response.statusCode == 200) {
        //Successfully Deleted

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Category deleted'),
          ),
        );

        widget.notifyParent();
      } else {
        //Handle error
      }
    });
  }
}
