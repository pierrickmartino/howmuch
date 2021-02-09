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

class TransactionList extends StatefulWidget {
  const TransactionList({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
            ? StreamBuilder<List<TransactionWithCategory>>(
                stream: bloc.homeScreenEntries,
                builder: (context, snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                      Container(
                        height: widget.screenSize.height * 0.65,
                        width: widget.screenSize.width * 0.88,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot
                                  .data[index].category.description
                                  .toLowerCase()),
                              subtitle: Text(_dateFormat
                                  .format(snapshot
                                      .data[index].transaction.valueDate)
                                  .toLowerCase()),
                              trailing: Text(
                                'CHF  ${_numberFormat.format(snapshot.data[index].transaction.transactionAmount)}',
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: children,
                    ),
                  );
                },
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
