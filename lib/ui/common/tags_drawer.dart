import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/blocs/category.dart';

import '../../src/blocs/category.dart';
import 'index.dart';

class TagsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Todo-List Demo with moor',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white),
            ),
            decoration: BoxDecoration(color: Colors.orange),
          ),
          Flexible(
            child: StreamBuilder<List<TagWithActiveInfo>>(
              stream: BlocProvider.of<HowMuchAppBloc>(context).tags,
              builder: (context, snapshot) {
                final tags = snapshot.data ?? <TagWithActiveInfo>[];

                return ListView.builder(
                  itemBuilder: (context, index) {
                    return _TagDrawerEntry(entry: tags[index]);
                  },
                  itemCount: tags.length,
                );
              },
            ),
          ),
          Spacer(),
          Row(
            children: <Widget>[
              FlatButton(
                child: const Text('Add tag'),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  showDialog(context: context, builder: (_) => AddTagDialog());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagDrawerEntry extends StatelessWidget {
  final TagWithActiveInfo entry;

  const _TagDrawerEntry({Key key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tag = entry.tagWithCount.tag;
    String title;
    if (tag == null) {
      title = 'No tag';
    } else {
      title = tag.name ?? 'Unnamed';
    }

    final isActive = entry.isActive;
    final bloc = BlocProvider.of<HowMuchAppBloc>(context);

    final rowContent = [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isActive ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${entry.tagWithCount?.count} entries'),
      ),
    ];

    // also show a delete button if the category can be deleted
    if (tag != null) {
      rowContent.addAll([
        Spacer(),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          color: Colors.red,
          onPressed: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Delete'),
                  content: Text('Really delete tag $title?'),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                    FlatButton(
                      child: const Text('Delete'),
                      textColor: Colors.red,
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                );
              },
            );

            if (confirmed == true) {
              // can be null when the dialog is dismissed
              bloc.deleteTag(tag);
            }
          },
        ),
      ]);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        color: isActive
            ? Colors.orangeAccent.withOpacity(0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            bloc.showTag(entry.tagWithCount.tag);
            Navigator.pop(context); // close the navigation drawer
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: rowContent,
            ),
          ),
        ),
      ),
    );
  }
}
