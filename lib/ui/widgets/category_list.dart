//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/bloc/bloc.dart';
import 'package:howmuch/src/database/database.dart';
import 'package:howmuch/ui/common/custom_card.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'category_add_dialog.dart';
import 'category_edit_dialog.dart';
import 'responsive.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);
// final _percentFormat =
//     NumberFormat.decimalPercentPattern(locale: 'de_CH', decimalDigits: 1);

class CategoryList extends StatefulWidget {
  const CategoryList({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  void refresh() {
    setState(() {});
  }

  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 15
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 15
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  Row(children: [
                    IconButton(
                      icon: const Icon(
                        LineAwesomeIcons.refresh,
                        size: 20,
                      ),
                      onPressed: refresh,
                    ),
                    IconButton(
                      icon: const Icon(
                        LineAwesomeIcons.plus,
                        size: 20,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CategoryAddDialog(),
                        );
                      },
                    ),
                  ]),
                  SizedBox(
                    height: widget.screenSize.height / 80,
                  ),
                  StreamBuilder<List<CategoryWithInfo>>(
                    stream: bloc.getCategoriesWithInfo,
                    builder: (context, snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          Container(
                            height: 750,
                            width: widget.screenSize.width * 0.88,
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, 0, widget.screenSize.height / 80),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      widget.screenSize.width / 90,
                                      widget.screenSize.width / 90,
                                      widget.screenSize.height / 80,
                                      0),
                                  child: CustomCard(
                                    padding: 12,
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data[index].category
                                                  .description
                                                  .toLowerCase(),
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryTextTheme
                                                      .button
                                                      .color,
                                                  fontSize: 14),
                                            ),
                                            const Spacer(),
                                            Text(
                                              (snapshot.data[index].amount !=
                                                      null)
                                                  ? 'CHF  ${_numberFormat.format(snapshot.data[index].amount)}'
                                                  : 'CHF  -',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryTextTheme
                                                      .button
                                                      .color,
                                                  fontSize: ResponsiveWidget
                                                          .isSmallScreen(
                                                              context)
                                                      ? 14
                                                      : 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: widget.screenSize.height / 80,
                                        ),
                                        Row(
                                          children: [
                                            if (snapshot
                                                .data[index].category.editable)
                                              const SizedBox.shrink()
                                            else
                                              IconButton(
                                                icon: const Icon(
                                                    LineAwesomeIcons.lock),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'sorry, this category is locked'),
                                                    ),
                                                  );
                                                },
                                              ),
                                            if (snapshot
                                                .data[index].category.editable)
                                              IconButton(
                                                icon: const Icon(
                                                    LineAwesomeIcons.edit),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        CategoryEditDialog(
                                                      entry: snapshot
                                                          .data[index].category,
                                                    ),
                                                  );
                                                },
                                              )
                                            else
                                              const SizedBox.shrink(),
                                            const Spacer(),
                                            if (snapshot
                                                .data[index].category.editable)
                                              IconButton(
                                                icon: const Icon(
                                                    LineAwesomeIcons.trash),
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              HowMuchAppBloc>(
                                                          context)
                                                      .deleteCategory(snapshot
                                                          .data[index]
                                                          .category);

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      backgroundColor:
                                                          Colors.orange,
                                                      content: Text(
                                                          'category successfully deleted'),
                                                    ),
                                                  );
                                                },
                                              )
                                            else
                                              const SizedBox.shrink(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ];
                      } else if (snapshot.hasError) {
                        children = <Widget>[
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text('Error: ${snapshot.error}'),
                          )
                        ];
                      } else {
                        children = <Widget>[
                          const SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          )
                        ];
                      }
                      return Center(
                        heightFactor: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: children,
                        ),
                      );
                    },
                  ),
                ],
              )
            : Padding(
                padding: EdgeInsets.only(
                  top: widget.screenSize.height * 0.06,
                  left: widget.screenSize.width / 15,
                  right: widget.screenSize.width / 15,
                ),
                child: Row(),
              ),
      ),
    );
  }
}
