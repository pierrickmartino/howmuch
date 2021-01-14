import 'package:flutter/material.dart';

import 'dashboard_left_top.dart';
import 'dashboard_left_header.dart';
import 'dashboard_left_center.dart';
import 'dashboard_left_footer.dart';

class DashboardLeft extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;

  DashboardLeft(
      {@required this.containerHeight, @required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: LeftLayoutWidget(),
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
          height: 80.0,
          width: containerWidth,
          child: LeftTopLayout(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: containerWidth,
            child: LeftHeaderLayout(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: containerWidth,
            child: LeftCenterLayout(),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: containerWidth,
            child: LeftFooterLayout(),
          ),
        ),
      ],
    );
  }
}
