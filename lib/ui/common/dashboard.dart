import 'package:flutter/material.dart';
import 'package:howmuch/ui/dashboard/account_list.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../constant/const.dart';
import '../../constant/fake_data.dart';
import '../../src/model/dashboard_filter.dart';
import '../dashboard/top_transaction_list.dart';
import '../dashboard/top_category_list.dart';
import '../chart/balance_analysis_per_month.dart';
import '../chart/balance_analysis_per_year.dart';
import 'custom_card.dart'; // https://pub.dev/packages/fluid_layout

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);
final _percentFormat =
    NumberFormat.decimalPercentPattern(locale: 'de_CH', decimalDigits: 2);

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FractionallySizedWidthWidget(widthFactor: 0.9),
            ],
          ),
        ],
      ),
    );
  }
}

class FractionallySizedWidthWidget extends StatelessWidget {
  final double widthFactor;
  FractionallySizedWidthWidget({@required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: widthFactor,
        child: MainLayoutWidget(),
      ),
    );
  }
}

class MainLayoutWidget extends StatelessWidget {
  MainLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height - 20;
    double containerWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: containerHeight,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: LeftLayoutWidget(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: containerHeight,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomCard(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Text('Hello'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text(
                                    'Accounts',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  icon: Icon(LineAwesomeIcons.ellipsis_h),
                                  color: Color(buttonColor),
                                  onPressed: () => null,
                                )
                              ],
                            ),
                            AccountList(containerWidth: containerWidth),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text(
                                    'Recent Transactions',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  icon: Icon(LineAwesomeIcons.ellipsis_h),
                                  color: Color(buttonColor),
                                  onPressed: () => null,
                                )
                              ],
                            ),
                            TopTransactionList(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text(
                                    'Recent Categories',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  icon: Icon(LineAwesomeIcons.ellipsis_h),
                                  color: Color(buttonColor),
                                  onPressed: () => null,
                                )
                              ],
                            ),
                            TopCategoryList(),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LeftLayoutWidget extends StatelessWidget {
  LeftLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.1) -
        ((MediaQuery.of(context).size.width * 0.1) * 2 / 7);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 100.0,
          width: containerWidth,
          child: TopLayoutWidget(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: containerWidth,
            child: HeaderLayoutWidget(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: containerWidth,
            child: MiddleLayoutWidget(),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            width: containerWidth,
            child: BottomLayoutWidget(),
          ),
        )
      ],
    );
  }
}

class SummaryWidget extends StatelessWidget {
  final String widgetType;
  final double amount, variation;
  SummaryWidget(
      {@required this.widgetType,
      @required this.amount,
      @required this.variation});

  @override
  Widget build(BuildContext context) {
    String subtitle, variationTitle, periodLabel;
    IconData icon, iconVariation;
    Color colorVariation;

    // period selected in the top widget of the dashboard
    var _periodValue = Provider.of<DashboardFilter>(context).getPeriodFilter;
    switch (_periodValue) {
      case 1:
        periodLabel = 'Week';
        break;
      case 2:
        periodLabel = 'Month';
        break;
      case 3:
        periodLabel = 'Year';
        break;
      default:
        periodLabel = 'N/A';
    }

    colorVariation =
        this.variation < 0 ? Color(debitColor) : Color(creditColor);
    iconVariation = this.variation < 0
        ? LineAwesomeIcons.chevron_circle_down
        : LineAwesomeIcons.chevron_circle_up;

    if (this.widgetType == 'INCOME') {
      subtitle = 'Income In this ' + periodLabel;
      variationTitle = 'Balance Up by';
      icon = LineAwesomeIcons.battery_full;
    }
    if (this.widgetType == 'OUTCOME') {
      subtitle = 'Outcome In this ' + periodLabel;
      variationTitle = 'Balance Down by';
      icon = LineAwesomeIcons.battery_quarter;
    }
    if (this.widgetType == 'SAVINGS') {
      subtitle = 'Saved In this ' + periodLabel;
      variationTitle = 'Saved Up by';
      icon = LineAwesomeIcons.leaf;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(icon, size: 36),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CHF  ' + _numberFormat.format(this.amount),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(buttonColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(variationTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(buttonColor),
                  )),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Icon(
                  iconVariation,
                  size: 22,
                  color: colorVariation,
                ),
              ),
              Text(
                _percentFormat.format(this.variation),
                style: TextStyle(
                  color: colorVariation,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HeaderLayoutWidget extends StatelessWidget {
  HeaderLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20 - 100) * 3 / 11);

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomCard(
                  child: SummaryWidget(
                    widgetType: 'INCOME',
                    amount: FakeData.fakeIncome,
                    variation: FakeData.fakeIncomeVariation / 100.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomCard(
                  child: SummaryWidget(
                    widgetType: 'OUTCOME',
                    amount: FakeData.fakeOutcome,
                    variation: FakeData.fakeOutcomeVariation / 100.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomCard(
                  child: SummaryWidget(
                    widgetType: 'SAVINGS',
                    amount: FakeData.fakeSavings,
                    variation: FakeData.fakeSavingsVariation / 100.0,
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}

class MiddleLayoutWidget extends StatelessWidget {
  MiddleLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20 - 100) * 3 / 11);

    String periodLabel;

    // period selected in the top widget of the dashboard
    var _periodValue = Provider.of<DashboardFilter>(context).getPeriodFilter;
    switch (_periodValue) {
      case 1:
        periodLabel = 'Weekly';
        break;
      case 2:
        periodLabel = 'Monthly';
        break;
      case 3:
        periodLabel = 'Yearly';
        break;
      default:
        periodLabel = 'N/A';
    }

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              'Title',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        child: Text('CYAN'),
                      )),
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        color: Color(menuBackgroundColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    periodLabel + ' Balance',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(menuTextColor),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    visualDensity:
                                        VisualDensity.adaptivePlatformDensity,
                                    icon: Icon(LineAwesomeIcons.ellipsis_h),
                                    color: Color(buttonColor),
                                    onPressed: () => null,
                                  )
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'CHF  ' +
                                      _numberFormat
                                          .format(FakeData.fakeBalance),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(menuSelectedTextColor),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: LiquidLinearProgressIndicator(
                                  value: 0.75,
                                  valueColor: AlwaysStoppedAnimation(
                                      Color(menuSelectedIconColor)),
                                  backgroundColor: Color(menuTextColor),
                                  borderRadius: 12.0,
                                  direction: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ]),
              ),
            ),
          ),
        ]);
  }
}

class BottomLayoutWidget extends StatelessWidget {
  BottomLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20 - 100) * 5 / 11);

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              'Balance Analytic per Month',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BalanceAnalysisPerMonth(),
                        ),
                      )),
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              'per Year',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: BalanceAnalysisPerYear(),
                        ),
                      )),
                    ]),
              ),
            ),
          ),
        ]);
  }
}

class TopLayoutWidget extends StatelessWidget {
  void setPeriodFilter(BuildContext context, int _period) {
    Provider.of<DashboardFilter>(context, listen: false)
        .setPeriodFilter(_period);
  }

  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed(loginRoute)
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );

    var _periodValue = Provider.of<DashboardFilter>(context).getPeriodFilter;
    double containerHeight = 100;

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.0,
                  children: [
                    ChoiceChip(
                        label: Text("This week"),
                        selected: _periodValue == 1,
                        onSelected: (bool value) {
                          //setState(() {
                          _periodValue = value ? 1 : null;
                          Provider.of<DashboardFilter>(context, listen: false)
                              .setPeriodFilter(_periodValue);
                          logger.d('Period filter update');
                          print('Period: ' + _periodValue.toString());
                          //});
                        }),
                    ChoiceChip(
                        label: Text("This month"),
                        selected: _periodValue == 2,
                        onSelected: (bool value) {
                          //setState(() {
                          _periodValue = value ? 2 : null;
                          Provider.of<DashboardFilter>(context, listen: false)
                              .setPeriodFilter(_periodValue);
                          logger.d('Period filter update');
                          print('Period: ' + _periodValue.toString());
                          // });
                        }),
                    ChoiceChip(
                        label: Text("This year"),
                        selected: _periodValue == 3,
                        onSelected: (bool value) {
                          //setState(() {
                          _periodValue = value ? 3 : null;
                          Provider.of<DashboardFilter>(context, listen: false)
                              .setPeriodFilter(_periodValue);
                          logger.d('Period filter update');
                          print('Period: ' + _periodValue.toString());
                          // });
                        }),
                    IconButton(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      icon: Icon(LineAwesomeIcons.bell),
                      color: Color(buttonColor),
                      onPressed: () => null,
                    ),
                    IconButton(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      icon: Icon(LineAwesomeIcons.sign_out),
                      color: Color(buttonColor),
                      onPressed: () => _goToLogin(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}
