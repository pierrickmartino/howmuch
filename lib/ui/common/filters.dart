import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../chart/date_time_axis_chart.dart';
import '../../constant/const.dart';
import '../../src/model/transaction.dart';
import '../dashboard/top_transaction_list.dart';
import '../dashboard/top_category_list.dart';
import '../dashboard/frequency_transaction.dart';
import 'custom_card.dart'; // https://pub.dev/packages/fluid_layout

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
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
                                  Wrap(
                                    spacing: 10.0,
                                    children: [
                                      ChoiceChip(
                                        label: Text("Last week"),
                                        selected: true,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                      ChoiceChip(
                                        label: Text("Last month"),
                                        selected: false,
                                      ),
                                      ChoiceChip(
                                        label: Text("Last year"),
                                        selected: false,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(LineAwesomeIcons.bell),
                                    color: Color(buttonColor),
                                    onPressed: () => null,
                                  ),
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
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      IconButton(
                                        icon: Icon(LineAwesomeIcons.bars),
                                        color: Color(buttonColor),
                                        iconSize: 20,
                                        onPressed: () => null,
                                      ),
                                      Spacer(),
                                      Text(
                                        'Top Transactions',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomCard(
                                    child: TopTransactionList(),
                                  )
                                ])),
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(4, s: 12, xs: 12),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      IconButton(
                                        icon: Icon(LineAwesomeIcons.bars),
                                        color: Color(buttonColor),
                                        iconSize: 20,
                                        onPressed: () => null,
                                      ),
                                      Spacer(),
                                      Text(
                                        'Top Categories',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomCard(
                                    child: TopCategoryList(),
                                  )
                                ])),
// Right panel
                        FluidCell.withFluidHeight(
                            size: context.fluid(4, s: 12, xs: 12),
                            heightSize: context.fluid(12, s: 12, xs: 12),
                            child: CustomCard(
                              child: TopTransactionList(),
                            )),
// Middle
                        FluidCell.withFluidHeight(
                            size: context.fluid(3, s: 12, xs: 12),
                            heightSize: context.fluid(2, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(
                                  child:
                                      Text('Total expense / income / balance')),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(3, s: 12, xs: 12),
                            heightSize: context.fluid(2, s: 12, xs: 12),
                            child: CustomCard(
                              child: FrequencyTransaction(),
                            )),
                        FluidCell.withFluidHeight(
                            size: context.fluid(2, s: 12, xs: 12),
                            heightSize: context.fluid(2, s: 12, xs: 12),
                            child: CustomCard(
                              child: FrequencyTransaction(),
                            )),

// Ligne du bas
                        FluidCell.withFluidHeight(
                            size: context.fluid(8, s: 12, xs: 12),
                            heightSize: context.fluid(6, s: 12, xs: 12),
                            child: CustomCard(
                              child: Center(child: DateTimeAxisChart()),
                              //Text('Chart bar daily in/out per month')),
                            )),
                      ],
                    ),
                  ],
                )));
  }
}
