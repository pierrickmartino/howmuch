import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:undo/undo.dart';

import 'add_category_dialog.dart';
import 'custom_card.dart'; // https://pub.dev/packages/fluid_layout
import 'index.dart';
import '../../src/database/database.dart';
import '../../src/blocs/category.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final double year;
  final double sales;
}

class _CategoriesState extends State<Categories> {
  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);

  @override
  Widget build(BuildContext context) {
    final List<_SalesData> chartData = [
      _SalesData(2010, 35),
      _SalesData(2011, 28),
      _SalesData(2012, 34),
      _SalesData(2013, 32),
      _SalesData(2014, 40)
    ];

    return BlocBuilder<HowMuchAppBloc, ChangeStack>(
        builder: (context, cs) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (_) => AddCategoryDialog());
                },
                tooltip: 'New category',
                child: Icon(LineAwesomeIcons.plus),
              ), // This trailing comma makes auto-formatting nicer for build methods.
              body: Container(
                color: Colors.grey[200],
                child: FluidLayout(
                  child: Builder(
                    builder: (context) => SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                FluidLayout.of(context).horizontalPadding),
                        child: Column(
                          children: <Widget>[
                            Fluid(
                                child: Container(
                              //color: Colors.blue,
                              height: 50,
                              width: double.infinity,
                              child: Text(
                                'Categories',
                                style: Theme.of(context).textTheme.headline4,
                                //   CustomCard(
                                //   color: Colors.white,
                                //   child: Center(
                                //       child: Text(
                                //     'Categories',
                                //     style: Theme.of(context).textTheme.headline1,
                                //   )),
                                // )
                              ),
                            )),
                            SizedBox(height: 24),
                            Container(
                              height: 180,
                              child: ListView.separated(
                                itemCount: 4,
                                padding: EdgeInsets.symmetric(
                                    horizontal: FluidLayout.of(context)
                                            .horizontalPadding +
                                        FluidLayout.of(context).fluidPadding),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => CustomCard(
                                    //color: Colors.green,
                                    child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        // Chart title
                                        title: ChartTitle(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                            alignment: ChartAlignment.near,
                                            text: 'Half yearly sales analysis'),

                                        // Enable legend
                                        legend: Legend(isVisible: false),
                                        // Enable tooltip
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        series: <ChartSeries>[
                                      LineSeries<_SalesData, double>(
                                          dataSource: chartData,
                                          xValueMapper: (_SalesData sales, _) =>
                                              sales.year,
                                          yValueMapper: (_SalesData sales, _) =>
                                              sales.sales,
                                          // Enable data label
                                          dataLabelSettings: DataLabelSettings(
                                              isVisible: true))
                                    ])
                                    // Container(
                                    //     height: 180,
                                    //     width: 200,
                                    //     child: Center(
                                    //       child: Text('Item'),
                                    //     ))
                                    ),
                                separatorBuilder: (_, __) => SizedBox(
                                    width: FluidLayout.of(context)
                                        .horizontalPadding),
                              ),
                            ),
                            SizedBox(height: 24),
                            Fluid(
                                child: Container(
                              height: MediaQuery.of(context).size.height -
                                  180 -
                                  24 -
                                  24 -
                                  80,
                              width: double.infinity,
                              child: Center(
                                child: StreamBuilder<List<CategoryWithTag>>(
                                  stream: bloc.homeScreenEntries,
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Align(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    final activeCategories = snapshot.data;

                                    return ListView.builder(
                                      itemCount: activeCategories.length,
                                      itemBuilder: (context, index) {
                                        return CategoryCard(
                                            activeCategories[index].category);
                                      },
                                    );
                                  },
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
