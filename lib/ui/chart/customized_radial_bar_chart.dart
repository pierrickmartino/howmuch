import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fluid_layout/fluid_layout.dart';

import '../../src/model/sample_view.dart';

Faker faker = Faker();
List<ChartSampleData> _fakeDataSources = List.generate(
    5,
    (index) => ChartSampleData(
        x: faker.food.cuisine(),
        y: faker.randomGenerator.integer(100, min: 0),
        text: faker.randomGenerator.integer(100, min: 0).toString() + '%',
        pointColor: Color.fromRGBO(
            faker.randomGenerator.integer(200, min: 50),
            faker.randomGenerator.integer(200, min: 50),
            faker.randomGenerator.integer(200, min: 50),
            1.0)),
    growable: false);

List<CircularChartAnnotation> _fakeAnnotationSources = List.generate(
    5,
    (index) => CircularChartAnnotation(
          angle: 0,
          radius: '0%',
          widget: Container(child: Text('V')
              // Image.asset(
              //   'images/car_legend.png',
              //   width: 20,
              //   height: 20,
              //   color: const Color.fromRGBO(69, 186, 161, 1.0),
              // ),
              ),
        ),
    growable: false);

class CustomizedRadialBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
          text: context.breakpoint.isLargerThanM ? 'Top 5 categories' : ''),
      legend: Legend(
        isVisible: context.breakpoint.isLargerThanM ? true : false,
        overflowMode: LegendItemOverflowMode.wrap,
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) {
          return Container(
              height: 60,
              width: 150,
              child: Row(children: <Widget>[
                Container(
                    height: 75,
                    width: 65,
                    child: SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        _fakeAnnotationSources[index],
                      ],
                      series: <RadialBarSeries<ChartSampleData, String>>[
                        RadialBarSeries<ChartSampleData, String>(
                            animationDuration: 0,
                            dataSource: <ChartSampleData>[
                              _fakeDataSources[index]
                            ],
                            maximumValue: 100,
                            radius: '100%',
                            cornerStyle: CornerStyle.bothCurve,
                            xValueMapper: (ChartSampleData data, _) => point.x,
                            yValueMapper: (ChartSampleData data, _) => data.y,
                            pointColorMapper: (ChartSampleData data, _) =>
                                data.pointColor,
                            innerRadius: '70%',
                            pointRadiusMapper: (ChartSampleData data, _) =>
                                data.text),
                      ],
                    )),
                Container(
                    width: 72,
                    child: Text(
                      point.x,
                      style: TextStyle(
                          color: _fakeDataSources[index].pointColor,
                          fontWeight: FontWeight.bold),
                    )),
              ]));
        },
      ),
      series: _getRadialBarCustomizedSeries(),
      tooltipBehavior:
          TooltipBehavior(enable: true, format: 'point.x : point.y%'),
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          angle: 0,
          radius: '0%',
          height: '90%',
          width: '90%',
          widget: Container(
            child:
                //Text('Pic'),
                Image.asset(
              'asset/images/person.png',
              height: 100.0,
              width: 100.0,
            ),
          ),
        ),
      ],
    );
  }

  /// Returns radial bar which need to be customized.
  List<RadialBarSeries<ChartSampleData, String>>
      _getRadialBarCustomizedSeries() {
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
        animationDuration: 0,
        maximumValue: 100,
        gap: '10%',
        radius: '100%',
        dataSource: _fakeDataSources, //chartData,
        cornerStyle: CornerStyle.bothCurve,
        innerRadius: '50%',
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointRadiusMapper: (ChartSampleData data, _) => data.text,

        /// Color mapper for each bar in radial bar series,
        /// which is get from datasource.
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        legendIconType: LegendIconType.circle,
      ),
    ];
  }
}
