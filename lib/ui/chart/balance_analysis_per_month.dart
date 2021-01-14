/// Package import
import 'package:flutter/material.dart';
import 'package:howmuch/constant/const.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:faker/faker.dart';

Faker faker = Faker();

class BalanceAnalysisPerMonth extends StatelessWidget {
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
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}k',
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(color: Colors.transparent),
      ),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries<_ChartData, String>> _getDefaultLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(
        'Jan',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Feb',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Mar',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Apr',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'May',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Jun',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Jul',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Aug',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Sep',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Oct',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Nov',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      ),
      _ChartData(
        'Dec',
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
        faker.randomGenerator.integer(10).roundToDouble(),
      )
    ];
    return <ChartSeries<_ChartData, String>>[
      ColumnSeries<_ChartData, String>(
        animationDuration: 2500,
        borderRadius: BorderRadius.circular(15),
        color: Color(creditColor),
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
        width: 0.6,
        spacing: 0.2,
        name: 'Income',
        markerSettings: MarkerSettings(isVisible: false),
      ),
      ColumnSeries<_ChartData, String>(
        animationDuration: 2500,
        borderRadius: BorderRadius.circular(15),
        color: Color(debitColor),
        dataSource: chartData,
        width: 0.6,
        spacing: 0.2,
        name: 'Outcome',
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y2,
        markerSettings: MarkerSettings(isVisible: false),
      ),
      SplineSeries<_ChartData, String>(
          dataSource: chartData,
          opacity: 0.8,
          color: Color(menuTextColor),
          //yAxisName: 'yAxis1',
          width: 4,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.secondSeriesYValue,
          name: 'Balance')
    ];
  }
}

class _ChartData {
  _ChartData(
    this.x,
    this.y,
    this.y2,
    this.secondSeriesYValue,
  );
  final String x;
  final double y;
  final double y2;
  final double secondSeriesYValue;
}
