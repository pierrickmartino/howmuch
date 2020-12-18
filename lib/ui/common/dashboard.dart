import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../constant/const.dart';
import '../../constant/fake_data.dart';
import '../../src/model/dashboard_filter.dart';
import '../dashboard/summary.dart';
import '../dashboard/dashboard_right.dart';

import '../chart/balance_analysis_per_month.dart';
import '../chart/balance_analysis_per_year.dart';
import '../chart/category_analysis.dart';
import 'custom_card.dart'; // https://pub.dev/packages/fluid_layout

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [FractionallySizedWidthWidget(widthFactor: 0.9)])
    ]));
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
          child: MainLayoutWidget()),
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
                  child: LeftLayoutWidget())),
          Expanded(
              flex: 2,
              child: DashboardRight(
                  containerHeight: containerHeight,
                  containerWidth: containerWidth))
        ]);
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
              height: 100.0, width: containerWidth, child: TopLayoutWidget()),
          Expanded(
              flex: 2,
              child: Container(
                  width: containerWidth, child: HeaderLayoutWidget())),
          Expanded(
              flex: 3,
              child: Container(
                  width: containerWidth, child: MiddleLayoutWidget())),
          Expanded(
              flex: 5,
              child:
                  Container(width: containerWidth, child: BottomLayoutWidget()))
        ]);
  }
}

class HeaderLayoutWidget extends StatelessWidget {
  HeaderLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20 - 100) * 3 / 10);

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
                          child: Summary(
                              widgetType: 'INCOME',
                              amount: FakeData.fakeIncome,
                              variation:
                                  FakeData.fakeIncomeVariation / 100.0))))),
          Expanded(
              flex: 3,
              child: Container(
                  height: containerHeight,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomCard(
                          child: Summary(
                              widgetType: 'OUTCOME',
                              amount: FakeData.fakeOutcome,
                              variation:
                                  FakeData.fakeOutcomeVariation / 100.0))))),
          Expanded(
              flex: 3,
              child: Container(
                  height: containerHeight,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomCard(
                          child: Summary(
                              widgetType: 'SAVINGS',
                              amount: FakeData.fakeSavings,
                              variation:
                                  FakeData.fakeSavingsVariation / 100.0)))))
        ]);
  }
}

class MiddleLayoutWidget extends StatelessWidget {
  MiddleLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20 - 100) * 3 / 10);

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
                            Row(mainAxisSize: MainAxisSize.max, children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text('Category Analytic',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))
                            ]),
                            SizedBox(height: 20),
                            Expanded(
                                child: CustomCard(
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CategoryAnalysis())))
                          ])))),
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
                            Row(mainAxisSize: MainAxisSize.max, children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text('',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))
                            ]),
                            SizedBox(height: 20),
                            Expanded(
                                child: CustomCard(
                                    color: Color(menuBackgroundColor),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                        periodLabel +
                                                            ' Balance',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                menuTextColor))),
                                                    Spacer(),
                                                    IconButton(
                                                        visualDensity: VisualDensity
                                                            .adaptivePlatformDensity,
                                                        icon: Icon(
                                                            LineAwesomeIcons
                                                                .ellipsis_h),
                                                        color:
                                                            Color(buttonColor),
                                                        onPressed: () => null)
                                                  ]),
                                              Spacer(),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                                  child: Text(
                                                      'CHF  ' +
                                                          _numberFormat.format(
                                                              FakeData
                                                                  .fakeBalance),
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              menuSelectedTextColor)))),
                                              Container(
                                                  width: double.infinity,
                                                  height: 30,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                                  child: LiquidLinearProgressIndicator(
                                                      value: 0.75,
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                              Color(
                                                                  menuSelectedIconColor)),
                                                      backgroundColor:
                                                          Color(menuTextColor),
                                                      borderRadius: 12.0,
                                                      direction:
                                                          Axis.horizontal))
                                            ]))))
                          ]))))
        ]);
  }
}

class BottomLayoutWidget extends StatelessWidget {
  BottomLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20 - 100) * 5 / 10);

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
                            Row(mainAxisSize: MainAxisSize.max, children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text('Balance Analytic per Month',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))
                            ]),
                            SizedBox(height: 20),
                            Expanded(
                                child: CustomCard(
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: BalanceAnalysisPerMonth())))
                          ])))),
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
                            Row(mainAxisSize: MainAxisSize.max, children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text('per Year',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))
                            ]),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                child: CustomCard(
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: BalanceAnalysisPerYear())))
                          ]))))
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
    var logger = Logger(printer: PrettyPrinter(methodCount: 0));

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
                                  _periodValue = value ? 1 : null;
                                  Provider.of<DashboardFilter>(context,
                                          listen: false)
                                      .setPeriodFilter(_periodValue);
                                  logger.d('Period filter update');
                                  print('Period: ' + _periodValue.toString());
                                }),
                            ChoiceChip(
                                label: Text("This month"),
                                selected: _periodValue == 2,
                                onSelected: (bool value) {
                                  _periodValue = value ? 2 : null;
                                  Provider.of<DashboardFilter>(context,
                                          listen: false)
                                      .setPeriodFilter(_periodValue);
                                  logger.d('Period filter update');
                                  print('Period: ' + _periodValue.toString());
                                }),
                            ChoiceChip(
                                label: Text("This year"),
                                selected: _periodValue == 3,
                                onSelected: (bool value) {
                                  _periodValue = value ? 3 : null;
                                  Provider.of<DashboardFilter>(context,
                                          listen: false)
                                      .setPeriodFilter(_periodValue);
                                  logger.d('Period filter update');
                                  print('Period: ' + _periodValue.toString());
                                }),
                            IconButton(
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                icon: Icon(LineAwesomeIcons.bell),
                                color: Color(buttonColor),
                                onPressed: () => null),
                            IconButton(
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                icon: Icon(LineAwesomeIcons.sign_out),
                                color: Color(buttonColor),
                                onPressed: () => _goToLogin(context))
                          ]))))
        ]);
  }
}
