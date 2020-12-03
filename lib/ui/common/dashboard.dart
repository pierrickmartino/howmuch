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
                    SliverToBoxAdapter(
                      child: Container(
                        color: Color(backgroundColor),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        height: 100,
                        child: Center(child: Text('Expanded')),
                      ),
                    ),
                    SliverFluidGrid(
                      children: [
// Ligne du haut
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('A')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('B')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('C')),
                            )),
// Ligne du bas
                        FluidCell.withFluidHeight(
                            size: context.fluid(6, s: 12, xs: 12),
                            heightSize: context.fluid(6, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('A')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(6, s: 12, xs: 12),
                            heightSize: context.fluid(6, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('B')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(12, s: 12, xs: 12),
                            heightSize: context.fluid(3, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: Text('Bottom')),
                            ))
                      ],
                    ),
                  ],
                )));
  }
}
