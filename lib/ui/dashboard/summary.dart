import 'package:flutter/material.dart';
import 'package:howmuch/ui/widgets/responsive.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
// import 'package:provider/provider.dart';

import '../../constant/const.dart';
// import '../../src/model/dashboard_filter.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 0);
final _percentFormat =
    NumberFormat.decimalPercentPattern(locale: 'de_CH', decimalDigits: 1);

class Summary extends StatelessWidget {
  const Summary(
      {Key key,
      @required this.widgetType,
      @required this.amount,
      @required this.variation,
      @required this.variationAmount})
      : super(key: key);

  final String widgetType;
  final double amount, variation, variationAmount;

  @override
  Widget build(BuildContext context) {
    String subtitle, variationTitle, variationAmountTitle, periodLabel;
    IconData icon, iconVariation, iconVariationAmount;
    Color colorVariation, colorVariationAmount;

    // period selected in the top widget of the dashboard
    //var _periodValue = Provider.of<DashboardFilter>(context).getPeriodFilter;
    const _periodValue = 2;

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
        variation < 0 ? const Color(debitColor) : const Color(creditColor);
    iconVariation =
        variation < 0 ? LineAwesomeIcons.caret_down : LineAwesomeIcons.caret_up;

    colorVariationAmount = variationAmount < 0
        ? const Color(debitColor)
        : const Color(creditColor);
    iconVariationAmount = variationAmount < 0
        ? LineAwesomeIcons.caret_down
        : LineAwesomeIcons.caret_up;

    if (widgetType == 'INCOME') {
      subtitle = 'Income In this $periodLabel';
      variationTitle = 'Balance Up by';
      variationAmountTitle = '';
      icon = LineAwesomeIcons.battery_full;
    }
    if (widgetType == 'OUTCOME') {
      subtitle = 'Outcome In this $periodLabel';
      variationTitle = 'Balance Down by';
      variationAmountTitle = '';
      icon = LineAwesomeIcons.battery_quarter;
    }
    if (widgetType == 'SAVINGS') {
      subtitle = 'Saved In this $periodLabel';
      variationTitle = 'Saved Up by';
      variationAmountTitle = '';
      icon = LineAwesomeIcons.leaf;
    }

    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10.0),
                    //   child: Icon(icon, size: 36),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20.0),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    Text(
                      'CHF  ${_numberFormat.format(amount)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryTextTheme.button.color,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 6.0),
                    //   child: Text(
                    //     subtitle,
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       color: Color(buttonColor),
                    //     ),
                    //   ),
                    // ),
                    //],
                    //),
                    //),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      variationTitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryTextTheme.button.color,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _percentFormat.format(variation),
                      style: TextStyle(
                        color: colorVariation,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 0, 0, 4),
                      child: Icon(
                        iconVariation,
                        size: 22,
                        color: colorVariation,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      variationAmountTitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryTextTheme.button.color,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _numberFormat.format(variationAmount),
                      style: TextStyle(
                        color: colorVariationAmount,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 0, 0, 4),
                      child: Icon(
                        iconVariationAmount,
                        size: 22,
                        color: colorVariationAmount,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Icon(icon, size: 36),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'CHF  ${_numberFormat.format(amount)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .button
                                  .color,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              subtitle,
                              style: const TextStyle(
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
                  children: [
                    Text(
                      variationTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(buttonColor),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Icon(
                        iconVariation,
                        size: 22,
                        color: colorVariation,
                      ),
                    ),
                    Text(
                      _percentFormat.format(variation),
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
