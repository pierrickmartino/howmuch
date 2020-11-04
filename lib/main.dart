import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart'; // https://pub.dev/packages/collapsible_sidebar
import 'dart:math' as math show pi;
//import 'package:responsive_framework/responsive_framework.dart'; // https://pub.dev/packages/responsive_framework
import 'package:fluid_layout/fluid_layout.dart';

import 'widgets/custom_card.dart'; // https://pub.dev/packages/fluid_layout

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SidebarPage(),
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items;
  String _headline;
  NetworkImage _avatarImg =
      NetworkImage('https://www.w3schools.com/howto/img_avatar.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Errors',
        icon: Icons.cancel,
        onPressed: () => setState(() => _headline = 'Errors'),
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => setState(() => _headline = 'Search'),
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: Icons.notifications,
        onPressed: () => setState(() => _headline = 'Notifications'),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () => setState(() => _headline = 'Settings'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        items: _items,
        avatarImg: _avatarImg,
        title: 'John Smith',
        body: _body(size, context),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: FluidLayout(
            child: Builder(
                builder: (context) => CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                            child: SizedBox(
                                height: context.fluid(60, xs: 12, s: 12))),
                        SliverFluidGrid(
                          children: [
                            if (context.breakpoint.isSmallerThanM)
                              FluidCell.fit(
                                  size: context.fluid(12),
                                  child: CustomCard(
                                      child: Container(
                                    height: 100,
                                    child: Center(
                                        child: Text(
                                            'Only visible in small screens')),
                                  ))),
                            FluidCell.withFluidHeight(
                                size: context.fluid(12),
                                heightSize: context.fluid(4),
                                child: CustomCard(
                                  color: Colors.green,
                                  child: Center(child: Text('Header')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 3, s: 6, xs: 6),
                                heightSize: context.fluid(3, m: 3, s: 6, xs: 6),
                                child: CustomCard(
                                  child: Center(child: Text('A')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 3, s: 6, xs: 6),
                                heightSize: context.fluid(3, m: 3, s: 4, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('B')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 3, s: 6, xs: 6),
                                heightSize: context.fluid(3, m: 3, s: 6, xs: 6),
                                child: CustomCard(
                                  child: Center(child: Text('C')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 3, s: 6, xs: 6),
                                heightSize: context.fluid(3, m: 3, s: 4, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('D')),
                                )),
                            FluidCell.withFixedHeight(
                                size: context.fluid(12),
                                height: 1,
                                child: Container(
                                  color: Colors.black12,
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 6, s: 12, xs: 12),
                                heightSize: 3,
                                child: CustomCard(
                                  color: Colors.green,
                                  child: Center(child: Text('1')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 6, s: 6, xs: 6),
                                heightSize: context.fluid(1.45, s: 2, xs: 2),
                                child: CustomCard(
                                  child: Center(child: Text('2')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 6, s: 6, xs: 6),
                                heightSize: context.fluid(1.45, s: 2, xs: 2),
                                child: CustomCard(
                                  child: Center(child: Text('3')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 6, s: 6, xs: 6),
                                heightSize: context.fluid(1.45, s: 2, xs: 2),
                                child: CustomCard(
                                  child: Center(child: Text('4')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 6, s: 6, xs: 6),
                                heightSize: context.fluid(1.45, s: 2, xs: 2),
                                child: CustomCard(
                                  child: Center(child: Text('5')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 6, s: 6, xs: 6),
                                heightSize: context.fluid(1.45, s: 2, xs: 2),
                                child: CustomCard(
                                  child: Center(child: Text('6')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(3, m: 6, s: 6, xs: 6),
                                heightSize: context.fluid(1.45, s: 2, xs: 2),
                                child: CustomCard(
                                  child: Center(child: Text('7')),
                                )),
                            FluidCell.withFixedHeight(
                                size: 12,
                                height: 150,
                                child: CustomCard(
                                  color: Colors.green,
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(2, l: 2, m: 4, s: 3, xs: 4),
                                heightSize:
                                    context.fluid(2, l: 2, m: 3, s: 3, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('I')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(2, l: 2, m: 4, s: 3, xs: 4),
                                heightSize:
                                    context.fluid(2, l: 2, m: 3, s: 3, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('I')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(2, l: 2, m: 4, s: 3, xs: 4),
                                heightSize:
                                    context.fluid(2, l: 2, m: 3, s: 3, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('I')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(2, l: 2, m: 4, s: 3, xs: 4),
                                heightSize:
                                    context.fluid(2, l: 2, m: 3, s: 3, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('I')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(2, l: 2, m: 4, s: 3, xs: 4),
                                heightSize:
                                    context.fluid(2, l: 2, m: 3, s: 3, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('I')),
                                )),
                            FluidCell.withFluidHeight(
                                size: context.fluid(2, l: 2, m: 4, s: 3, xs: 4),
                                heightSize:
                                    context.fluid(2, l: 2, m: 3, s: 3, xs: 4),
                                child: CustomCard(
                                  child: Center(child: Text('I')),
                                )),
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
                          ],
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 12),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            color: Colors.green,
                            height: 200,
                            child: Center(child: Text('Expanded')),
                          ),
                        ),
                        SliverToBoxAdapter(child: SizedBox(height: 40)),
                        context.breakpoint.isLargerThanM
                            ? SliverFluid(
                                sliver: SliverToBoxAdapter(
                                    child: CustomCard(
                                        child: Container(
                                  height: 300,
                                  child: Center(
                                      child:
                                          Text('Only visible in large screen')),
                                ))),
                              )
                            : SliverToBoxAdapter(child: Container()),
                        SliverToBoxAdapter(child: SizedBox(height: 40)),
                      ],
                    ))));
  }
}
