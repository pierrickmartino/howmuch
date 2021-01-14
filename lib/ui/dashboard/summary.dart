import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

import '../../constant/const.dart';
import '../../src/model/dashboard_filter.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);
final _percentFormat =
    NumberFormat.decimalPercentPattern(locale: 'de_CH', decimalDigits: 2);

class Summary extends StatelessWidget {
  final String widgetType;
  final double amount, variation;
  Summary(
      {@required this.widgetType,
      @required this.amount,
      @required this.variation});

  @override
  Widget build(BuildContext context) {
    String subtitle, variationTitle, periodLabel;
    IconData icon, iconVariation;
    Color colorVariation;

    // period selected in the top widget of the dashboard
    //var _periodValue = Provider.of<DashboardFilter>(context).getPeriodFilter;
    var _periodValue = 2;

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
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(buttonColor),
                        ),
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
              Text(
                variationTitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(buttonColor),
                ),
              ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
