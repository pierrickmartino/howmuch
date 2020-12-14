/// Package import
import 'package:flutter/material.dart';
import 'package:howmuch/constant/const.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:faker/faker.dart';

Faker faker = Faker();

class BalanceAnalysisPerYear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: ''),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.top),
      primaryXAxis: CategoryAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}k',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries<_ChartData, String>> _getDefaultLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(
        '2017',
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        '2018',
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        '2019',
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        '2020',
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        '2021',
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
    ];
    return <ChartSeries<_ChartData, String>>[
      ColumnSeries<_ChartData, String>(
          animationDuration: 2500,
          borderRadius: BorderRadius.circular(15),
          color: Color(menuTextColor),
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 0.6,
          //spacing: 0.2,
          name: 'Balance',
          markerSettings: MarkerSettings(isVisible: false)),
    ];
  }
}

class _ChartData {
  _ChartData(
    this.x,
    this.y,
  );
  final String x;
  final double y;
}
