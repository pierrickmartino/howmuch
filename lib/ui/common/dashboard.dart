import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:path/path.dart';

import '../chart/date_time_axis_chart.dart';
import '../chart/customized_radial_bar_chart.dart';
import '../../constant/const.dart';
import '../../src/model/transaction.dart';
import 'custom_card.dart'; // https://pub.dev/packages/fluid_layout

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static Faker faker = Faker();
  List<Transaction> fakeTransactionList = List.generate(
      5,
      (index) => Transaction(
            id: faker.guid.guid(),
            objectId: faker.guid.guid(),
            description: faker.company.name(),
            color: faker.randomGenerator.integer(4300000000, min: 4200000000),
            amount: faker.randomGenerator.integer(10000),
            date: null, //faker.date.dateTime(),
          ),
      growable: false);

  // Logout function
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed(loginRoute)
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

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
                              child: Row(
                                children: [
                                  Text(
                                    'Welcome Joe !',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(LineAwesomeIcons.sign_out),
                                    color: Color(buttonColor),
                                    onPressed: () => _goToLogin(context),
                                  )
                                ],
                              )),
                        ),
// Ligne du haut
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: CustomCard(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Top 5 transactions by size',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Divider(
                                    color: Color(menuBackgroundColor),
                                    height: 20,
                                    thickness: 2,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TransactionList(list: fakeTransactionList),
                                ],
                              ),
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
                              child: Center(child: DateTimeAxisChart()),
                              //Text('Chart bar daily in/out per month')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(6, s: 12, xs: 12),
                            heightSize: context.fluid(5, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(
                                child: CustomizedRadialBarChart(),
                                // Text(
                                //     'Chart radar of the top 6 categories per period')
                              ),
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

class TransactionList extends StatelessWidget {
  TransactionList({@required this.list});

  final list;

  @override
  Widget build(BuildContext transactionListContext) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: this.list.length,
      itemBuilder: (transactionListContext, index) {
        Transaction transaction = this.list[index];

        return TransactionItem(transaction: transaction);
      },
    );
  }
}

class TransactionItem extends StatelessWidget {
  TransactionItem({@required this.transaction});

  final transaction;

  @override
  Widget build(BuildContext transactionItemContext) {
    String transactionDescription, transactionAmount;

    transactionDescription = transaction.description;
    transactionAmount = transaction.amount.toString();

    return ListTile(
      title: Text(transactionDescription),
      trailing: Text(transactionAmount),
    );

    // return Card(
    //   color: Color(cardBackgroundColor),
    //   elevation: 4,
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       children: <Widget>[
    //         Expanded(
    //             child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 3.0),
    //               child: Text(
    //                 transactionDescription,
    //                 style: TextStyle(color: Color(cardTextColor)),
    //               ),
    //             ),

    //             /*, creationDate, lastUpdateDate*/
    //           ],
    //         )),
    //       ],
    //     ),
    //   ),
    // );
  }
}
