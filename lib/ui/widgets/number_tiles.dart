import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'responsive.dart';
import '../common/custom_card.dart';
import '../../src/bloc/bloc.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 0);
// ignore: unused_element
final _percentFormat =
    NumberFormat.decimalPercentPattern(locale: 'de_CH', decimalDigits: 1);

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
                      child: Row(
                        children: [
                          Text(
                            title[pageIndex],
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .button
                                    .color,
                                fontSize: 14),
                          ),
                          Spacer(),
                          NumberTilesCounter(
                              section: numbers[pageIndex],
                              contextParent: context),
                          SizedBox(height: widget.screenSize.height / 70),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
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
                            NumberTilesCounter(
                                section: numbers[pageIndex],
                                contextParent: context),
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

class NumberTilesCounter extends StatelessWidget {
  NumberTilesCounter({@required this.section, @required this.contextParent});

  final String section;
  final BuildContext contextParent;

  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(contextParent);

  @override
  Widget build(BuildContext context) {
    switch (section) {
      case 'TRANSACTION_COUNT':
        return FutureBuilder<int>(
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
                  color: Theme.of(context).primaryTextTheme.button.color,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
            );
          },
        );
      case 'TRANSACTION_AMOUNT':
        return FutureBuilder<double>(
          future: bloc.totalAmountTransactions,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }

            return Text(
              'CHF ' + _numberFormat.format(snapshot.data),
              style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.button.color,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
            );
          },
        );
        break;
      default:
        return Text(
          '0',
          style: TextStyle(
              color: Theme.of(context).primaryTextTheme.button.color,
              fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
        );
    }
  }
}
