import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fluid_layout/fluid_layout.dart';

import '../../src/model/sample_view.dart';

Faker faker = Faker();

class DateTimeAxisChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      //title: ChartTitle(text: context.breakpoint.isLargerThanM ? '' : ''),
      primaryXAxis: CategoryAxis(
        labelStyle: const TextStyle(color: Colors.black),
        axisLine: AxisLine(width: 0),
        labelPosition: ChartDataLabelPosition.outside,
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(isVisible: false, minimum: 0, maximum: 10000),
      series: _getRoundedColumnSeries(context),
      tooltipBehavior: TooltipBehavior(
          enable: true,
          canShowMarker: false,
          format: 'point.x : point.y',
          header: ''),
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getRoundedColumnSeries(
      BuildContext context) {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Jan', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Feb', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Mar', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Apr', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'May', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Jun', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Jul', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Aug', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Sep', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Oct', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Nov', y: faker.randomGenerator.integer(10000)),
      ChartSampleData(x: 'Dec', y: faker.randomGenerator.integer(10000)),
    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        width: 0.9,
        dataLabelSettings: DataLabelSettings(
            isVisible: context.breakpoint.isLargerThanM ? true : false,
            labelAlignment: ChartDataLabelAlignment.top),
        dataSource: chartData,

        /// If we set the border radius value for column series,
        /// then the series will appear as rounder corner.
        borderRadius: BorderRadius.circular(15),
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }
}
