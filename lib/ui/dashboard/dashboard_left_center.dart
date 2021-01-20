import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';

import '../../constant/const.dart';
import '../../constant/fake_data.dart';
import '../../src/model/dashboard_filter.dart';
import '../chart/category_analysis.dart';
import '../common/custom_card.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);

class LeftCenterLayout extends StatelessWidget {
  LeftCenterLayout();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20 - 80) * 3 / 10);

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
                          'Category Analytic',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CategoryAnalysis(),
                      ),
                    ),
                  ),
                ],
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
                  SizedBox(height: 20),
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
                                    onPressed: () => null)
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'CHF  ' +
                                    _numberFormat.format(FakeData.fakeBalance),
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
                              // child: LiquidLinearProgressIndicator(
                              //     value: 0.75,
                              //     valueColor: AlwaysStoppedAnimation(
                              //       Color(menuSelectedIconColor),
                              //     ),
                              //     backgroundColor: Color(menuTextColor),
                              //     borderRadius: 12.0,
                              //     direction: Axis.horizontal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
