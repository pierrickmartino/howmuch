import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:undo/undo.dart';

import 'custom_card.dart'; // https://pub.dev/packages/fluid_layout
import 'index.dart';
import '../../src/database/database.dart';
import '../../src/blocs/category.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  HowMuchAppBloc get bloc => BlocProvider.of<HowMuchAppBloc>(context);
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HowMuchAppBloc, ChangeStack>(
        builder: (context, cs) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
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
                              height: 80,
                              width: double.infinity,
                              child: Center(
                                  child: CustomCard(
                                color: Colors.white,
                                child: Center(child: Text('Header')),
                              )),
                            )),
                            SizedBox(height: 24),
                            Container(
                              height: 200,
                              child: ListView.separated(
                                itemCount: 8,
                                padding: EdgeInsets.symmetric(
                                    horizontal: FluidLayout.of(context)
                                            .horizontalPadding +
                                        FluidLayout.of(context).fluidPadding),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => CustomCard(
                                    color: Colors.green,
                                    child: Container(
                                        height: 200,
                                        width: 200,
                                        child: Center(
                                          child: Text('Item'),
                                        ))),
                                separatorBuilder: (_, __) => SizedBox(
                                    width: FluidLayout.of(context)
                                        .horizontalPadding),
                              ),
                            ),
                            SizedBox(height: 24),
                            FluidGridView(
                                shrinkWrap: true,
                                children: List.filled(
                                  20,
                                  FluidCell.withFluidHeight(
                                      size: context.fluid(12,
                                          m: 12, s: 12, xs: 12),
                                      heightSize:
                                          context.fluid(3, m: 3, s: 3, xs: 3),
                                      child: CustomCard(
                                        color: Colors.red,
                                        child: Center(child: Text('Item')),
                                      )),
                                )),
                            // Fluid(
                            //   child: Container(
                            //     height: MediaQuery.of(context).size.height -
                            //         200 -
                            //         24 -
                            //         24 -
                            //         80,
                            //     color: Colors.blue,
                            //     child: Center(
                            //       child: Text(
                            //         'Fluid body',
                            //         style: TextStyle(color: Colors.white),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Fluid(
                            //     child: CustomCard(
                            //   color: Colors.white,
                            //   child: Container(
                            //       height: 100,
                            //       width: double.infinity,
                            //       child: Center(
                            //         child: Text(
                            //           'Fluid',
                            //           style: TextStyle(color: Colors.white),
                            //         ),
                            //       )),
                            // )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
  // return Container(
  //   child: Text("Transactions"),
  // );
  // }
}
