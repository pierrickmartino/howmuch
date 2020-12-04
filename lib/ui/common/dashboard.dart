import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';

import '../../constant/const.dart';
import 'custom_card.dart'; // https://pub.dev/packages/fluid_layout

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return FluidLayout(
        child: Builder(
            builder: (context) => CustomScrollView(
                  slivers: <Widget>[
                    SliverFluidGrid(
                      spacing: 20,
                      children: [
// Header
                        FluidCell.withFixedHeight(
                          size: context.fluid(12, s: 12, xs: 12),
                          height: 80,
                          child: Container(
                              // decoration: BoxDecoration(
                              //   color: Color(menuBackgroundColor),
                              // ),
                              margin: EdgeInsets.only(top: 10),
                              child: Text('Welcome !')),
                        ),
// Ligne du haut
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(
                                  child: Text('Top 5 transactions by size')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(2, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(
                                  child:
                                      Text('Total expense / income / balance')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('C')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(2, s: 12, xs: 12),
                            child: CustomCard(
                              child:
                                  Center(child: Text('Number of transactions')),
                            )),

// Ligne du bas
                        FluidCell.withFluidHeight(
                            size: context.fluid(6, s: 12, xs: 12),
                            heightSize: context.fluid(5, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(
                                  child:
                                      Text('Chart bar daily in/out per month')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(6, s: 12, xs: 12),
                            heightSize: context.fluid(5, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(
                                  child: Text(
                                      'Chart radar of the top 6 categories per period')),
                            )),
// Bottom
                        FluidCell.withFluidHeight(
                            size: context.fluid(9, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('Transaction list')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(3, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(
                                  child: Text(
                                      'Number of transactions without category')),
                            ))
                      ],
                    ),
                  ],
                )));
  }
}
