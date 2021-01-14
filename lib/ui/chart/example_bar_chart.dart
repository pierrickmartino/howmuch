import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../common/custom_card.dart';

class _SalesData {
  _SalesData(this.year, this.sales);

  final double year;
  final double sales;
}

class ExempleBarChart extends StatelessWidget {
  final List<_SalesData> chartData = [
    _SalesData(2010, 35),
    _SalesData(2011, 28),
    _SalesData(2012, 34),
    _SalesData(2013, 32),
    _SalesData(2014, 40)
  ];

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      //color: Colors.green,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(
            textStyle: Theme.of(context).textTheme.subtitle2,
            alignment: ChartAlignment.near,
            text: 'Half yearly sales analysis'),

        // Enable legend
        legend: Legend(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          LineSeries<_SalesData, double>(
            dataSource: chartData,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            // Enable data label
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
      // Container(
      //     height: 180,
      //     width: 200,
      //     child: Center(
      //       child: Text('Item'),
      //     ),)
    );
  }
}
