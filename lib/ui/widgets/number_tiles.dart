import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/model/period_filter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../src/bloc/bloc.dart';
import '../common/custom_card.dart';
import 'responsive.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 0);
// ignore: unused_element
final _percentFormat =
    NumberFormat.decimalPercentPattern(locale: 'de_CH', decimalDigits: 1);

class NumberTiles extends StatefulWidget {
  const NumberTiles({Key key, @required this.screenSize}) : super(key: key);

  final Size screenSize;

  @override
  _NumberTilesState createState() => _NumberTilesState();
}

class _NumberTilesState extends State<NumberTiles> {
  void refresh() {
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
    final int _periodValue =
        Provider.of<PeriodFilter>(context).getPeriodFilterForNumbers;

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
                          const Spacer(),
                          NumberTilesCounter(
                            section: numbers[pageIndex],
                            contextParent: context,
                            selectedPeriod: _periodValue,
                          ),
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
                            const Spacer(),
                            NumberTilesCounter(
                              section: numbers[pageIndex],
                              contextParent: context,
                              selectedPeriod: _periodValue,
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

class NumberTilesCounter extends StatelessWidget {
  const NumberTilesCounter({
    Key key,
    @required this.section,
    @required this.contextParent,
    this.selectedPeriod,
  }) : super(key: key);

  final String section;
  final BuildContext contextParent;
  final int selectedPeriod;

  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(contextParent);

  @override
  Widget build(BuildContext context) {
    switch (section) {
      case 'TRANSACTION_COUNT':
        return FutureBuilder<int>(
          future: bloc.countTransactions(selectedPeriod),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Align(
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
                child: CircularProgressIndicator(),
              );
            }

            return Text(
              'CHF ${_numberFormat.format(snapshot.data)}',
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
