import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../constant/const.dart';
import '../../src/model/dashboard_filter.dart';

class LeftTopLayout extends StatelessWidget {
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
