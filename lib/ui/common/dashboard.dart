import 'package:flutter/material.dart';

import '../dashboard/dashboard_right.dart';
import '../dashboard/dashboard_left.dart';

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
              child: DashboardLeft(
                  containerHeight: containerHeight,
                  containerWidth: containerWidth)),
          Expanded(
              flex: 2,
              child: DashboardRight(
                  containerHeight: containerHeight,
                  containerWidth: containerWidth))
        ]);
  }
}
