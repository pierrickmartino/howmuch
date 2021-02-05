//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/constant/const.dart';
import 'package:howmuch/src/bloc/bloc.dart';
import 'package:howmuch/src/database/database.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:timelines/timelines.dart';
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
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.width * 0.06,
              left: widget.screenSize.width * 0.06,
              right: widget.screenSize.width * 0.06,
            ),
            child: SingleChildScrollView(
              child: FutureBuilder<List<Transaction>>(
                future: bloc
                    .getTransactionsByFuture, // a previously-obtained Future<String> or null
                builder: (context, snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                      Container(
                        height: widget.screenSize.height * 0.65,
                        width: widget.screenSize.width * 0.88,
                        child: Timeline.tileBuilder(
                            theme: TimelineThemeData(
                              nodePosition: 0.16,
                              color: Theme.of(context).iconTheme.color,
                              indicatorTheme: const IndicatorThemeData(
                                size: 15,
                              ),
                              connectorTheme: ConnectorThemeData(
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            builder: TimelineTileBuilder.connected(
                              indicatorBuilder: (context, index) {
                                return DotIndicator(
                                  size: 24,
                                  color: Theme.of(context).iconTheme.color,
                                  child: IconButton(
                                    icon: Icon(LineAwesomeIcons.check),
                                    padding: EdgeInsets.all(0),
                                    color: Theme.of(context).backgroundColor,
                                    iconSize: 14,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .backgroundColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text('Test'));
                                          });
                                    },
                                  ),
                                );
                              },
                              connectorBuilder:
                                  (context, index, connectorType) {
                                return SolidLineConnector(
                                  color: Theme.of(context).cardColor,
                                  indent: connectorType == ConnectorType.start
                                      ? 0
                                      : 4,
                                  endIndent: connectorType == ConnectorType.end
                                      ? 0
                                      : 4,
                                );
                              },
                              contentsBuilder: (context, index) {
                                Color colortransactionAmount =
                                    snapshot.data[index].transactionAmount < 0
                                        ? const Color(debitColor)
                                        : const Color(creditColor);

                                String line1, line2, line3;

                                if (snapshot.data[index].description.length >
                                    20) {
                                  line1 =
                                      '${snapshot.data[index].description.toLowerCase().substring(0, 20)}..';
                                } else {
                                  line1 = snapshot.data[index].description
                                      .toLowerCase();
                                }

                                if (snapshot.data[index].description2.length >
                                    20) {
                                  line2 =
                                      '${snapshot.data[index].description2.toLowerCase().substring(0, 20)}..';
                                } else {
                                  line2 = snapshot.data[index].description2
                                      .toLowerCase();
                                }

                                if (snapshot.data[index].description3.length >
                                    20) {
                                  line3 =
                                      '${snapshot.data[index].description3.toLowerCase().substring(0, 20)}..';
                                } else {
                                  line3 = snapshot.data[index].description3
                                      .toLowerCase();
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                    left: 16,
                                    bottom: 16,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(line1),
                                            Text(line2),
                                            Text(line3),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          _numberFormat.format(snapshot
                                              .data[index].transactionAmount),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colortransactionAmount,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              oppositeContentsBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                    right: 8,
                                    bottom: 16,
                                  ),
                                  child: Text(_dateFormat
                                      .format(snapshot.data[index].valueDate)
                                      .toLowerCase()),
                                );
                              },
                              itemCount: snapshot.data.length,
                            )),
                        // ListView.builder(
                        //     itemCount: snapshot.data.length,
                        //     itemBuilder: (context, index) {
                        //       return Row(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Expanded(
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 Text(snapshot.data[index].description),
                        //                 Text(snapshot.data[index].description2),
                        //                 Text(snapshot.data[index].description3
                        //                     .substring(0, 20)),
                        //               ],
                        //             ),
                        //           ),
                        //           Text(
                        //               'CHF ${_numberFormat.format(snapshot.data[index].transactionAmount)}'),
                        //         ],
                        //       );
                        //     }),
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
