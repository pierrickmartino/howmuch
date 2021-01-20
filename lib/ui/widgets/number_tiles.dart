import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/bloc/bloc.dart';

import 'responsive.dart';
import '../common/custom_card.dart';

class NumberTiles extends StatefulWidget {
  final Size screenSize;
  const NumberTiles({Key key, @required this.screenSize}) : super(key: key);

  @override
  _NumberTilesState createState() => _NumberTilesState();
}

class _NumberTilesState extends State<NumberTiles> {
  refresh() {
    setState(() {});
  }

  final List<String> numbers = [
    'TRANSACTION_AMOUNT',
    'TRANSACTION_COUNT',
    'TRANSACTION_UNKNOWN_COUNT',
    'TRANSACTION_FREQUENCY_DAILY',
    'TRANSACTION_FREQUENCY_MONTHLY',
  ];

  final List<String> title = [
    'Transactions total amount',
    'Transactions counter',
    'Unknown Transactions counter',
    'Frequency of Transactions per day',
    'Frequency of Transactions per month'
  ];

  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: 0, //screenSize.height / 20,
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
                  ...Iterable<int>.generate(numbers.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: CustomCard(
                        color: Theme.of(context).cardColor,
                        child: Row(
                          children: [
                            Text(
                              title[pageIndex],
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      .color,
                                  fontSize: 16),
                            ),
                            Spacer(),
                            FutureBuilder<int>(
                              future: bloc.countTransactions,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                return Text(
                                  snapshot.data.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .button
                                          .color,
                                      fontSize: 16),
                                );
                              },
                            ),
                            SizedBox(height: widget.screenSize.height / 70),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                // TODO
                children: [
                  ...Iterable<int>.generate(numbers.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: CustomCard(
                        color: Theme.of(context).cardColor,
                        child: Row(
                          children: [
                            Text(
                              title[pageIndex],
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1
                                    .color,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1
                                    .color,
                              ),
                            ),
                            SizedBox(height: widget.screenSize.height / 70),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}