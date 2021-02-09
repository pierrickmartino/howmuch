//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/bloc/bloc.dart';
import 'package:howmuch/src/database/database.dart';
import 'package:intl/intl.dart';
import 'responsive.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);
// ignore: unused_element
final _percentFormat =
    NumberFormat.decimalPercentPattern(locale: 'de_CH', decimalDigits: 1);
final _dateFormat = DateFormat.yMMMd();

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
  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.width * 0.06,
              left: widget.screenSize.width * 0.06,
              right: widget.screenSize.width * 0.06,
            ),
            child: SingleChildScrollView(
              child: StreamBuilder<List<Category>>(
                stream: bloc.getCategories,
                builder: (context, snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                      Container(
                        height: widget.screenSize.height * 0.65,
                        width: widget.screenSize.width * 0.88,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense: true,
                              title: Text(
                                  snapshot.data[index].description
                                      .toLowerCase(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .button
                                          .color,
                                      fontSize: 14)),
                              trailing: Text('0',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .button
                                          .color,
                                      fontSize: 14)),
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
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.06,
              left: widget.screenSize.width / 15,
              right: widget.screenSize.width / 15,
            ),
            child: Row(),
          );
  }
}
