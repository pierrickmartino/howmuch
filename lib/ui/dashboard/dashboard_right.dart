import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../../constant/const.dart';
import '../dashboard/top_transaction_list.dart';
import '../dashboard/account_list.dart';
import '../common/custom_card.dart'; // https://pub.dev/packages/fluid_layout

class DashboardRight extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;

  DashboardRight(
      {@required this.containerHeight, @required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: Container(child: Text('Hello'))),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(mainAxisSize: MainAxisSize.max, children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Text('Accounts',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              Spacer(),
                              IconButton(
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                icon: Icon(LineAwesomeIcons.ellipsis_h),
                                color: Color(buttonColor),
                                onPressed: () => null,
                              )
                            ]),
                            AccountList(containerWidth: containerWidth)
                          ])),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(mainAxisSize: MainAxisSize.max, children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text('Recent Transactions',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              Spacer(),
                              IconButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  icon: Icon(LineAwesomeIcons.ellipsis_h),
                                  color: Color(buttonColor),
                                  onPressed: () => null)
                            ]),
                            TopTransactionList(),
                          ])),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(mainAxisSize: MainAxisSize.max, children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text('Indicators',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              Spacer(),
                              IconButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  icon: Icon(LineAwesomeIcons.ellipsis_h),
                                  color: Color(buttonColor),
                                  onPressed: () => null)
                            ]),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ListView(shrinkWrap: true, children: [
                                    ListTile(
                                        minVerticalPadding: 0,
                                        dense: true,
                                        title: Text('Number of transactions',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        trailing: Text('0',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))),
                                    ListTile(
                                        minVerticalPadding: 0,
                                        dense: true,
                                        title: Text(
                                            'Number of transactions without category',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        trailing: Text('0',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)))
                                  ])
                                ])
                          ]))
                ]))));
  }
}
