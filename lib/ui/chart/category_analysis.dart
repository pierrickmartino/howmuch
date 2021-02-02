// /// Package import
// import 'package:flutter/material.dart';
// import 'package:howmuch/constant/const.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:faker/faker.dart';

// Faker faker = Faker();

// class CategoryAnalysis extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       plotAreaBorderWidth: 0,
//       title: ChartTitle(text: ''),
//       legend: Legend(isVisible: true),
//       primaryXAxis: CategoryAxis(
//         majorGridLines: MajorGridLines(width: 0),
//       ),
//       primaryYAxis: NumericAxis(
//         majorGridLines: MajorGridLines(width: 0),
//         numberFormat: NumberFormat.compact(),
//       ),
//       series: _getDefaultBarSeries(),
//       tooltipBehavior: TooltipBehavior(enable: true),
//     );
//   }

//   List<BarSeries<_ChartData, String>> _getDefaultBarSeries() {
//     final List<_ChartData> chartData = <_ChartData>[
//       _ChartData('France', 84452000, 82682000),
//       _ChartData('Spain', 68175000, 75315000),
//       _ChartData('US', 77774000, 76407000),
//       _ChartData('Italy', 50732000, 52372000),
//       _ChartData('Mexico', 32093000, 35079000)
//     ];
//     return <BarSeries<_ChartData, String>>[
//       BarSeries<_ChartData, String>(
//           width: 0.6,
//           spacing: 0.2,
//           color: Color(menuBackgroundColor),
//           borderRadius: BorderRadius.circular(15),
//           dataSource: chartData,
//           xValueMapper: (_ChartData sales, _) => sales.x,
//           yValueMapper: (_ChartData sales, _) => sales.y,
//           name: 'This period'),
//       BarSeries<_ChartData, String>(
//           width: 0.6,
//           spacing: 0.2,
//           opacity: 0.8,
//           color: Color(menuTextColor),
//           borderRadius: BorderRadius.circular(15),
//           dataSource: chartData,
//           xValueMapper: (_ChartData sales, _) => sales.x,
//           yValueMapper: (_ChartData sales, _) => sales.secondSeriesYValue,
//           name: 'Last period'),
//     ];
//   }
// }

// class _ChartData {
//   _ChartData(
//     this.x,
//     this.y,
//     this.secondSeriesYValue,
//   );
//   final String x;
//   final double y;
//   final double secondSeriesYValue;
// }
