import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../chart/date_time_axis_chart.dart';
import '../../constant/const.dart';
import '../../src/model/transaction.dart';
import '../dashboard/top_transaction_list.dart';
import '../dashboard/top_category_list.dart';
import '../dashboard/frequency_transaction.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FractionallySizedWidthWidget(widthFactor: 0.9),
            ],
          ),
        ],
      ),
    );
  }
}

class FractionallySizedWidthWidget extends StatelessWidget {
  final double widthFactor;
  FractionallySizedWidthWidget({@required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: widthFactor,
        child: MainLayoutWidget(),
      ),
    );
  }
}

class MainLayoutWidget extends StatelessWidget {
  MainLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height - 20;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: containerHeight,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: LeftLayoutWidget(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: containerHeight,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomCard(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Text('Hello'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Text(
                                  'Title',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text(
                                    'Recent Transactions',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  icon: Icon(LineAwesomeIcons.ellipsis_h),
                                  color: Color(buttonColor),
                                  onPressed: () => null,
                                )
                              ],
                            ),
                            TopTransactionList(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text(
                                    'Recent Categories',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  icon: Icon(LineAwesomeIcons.ellipsis_h),
                                  color: Color(buttonColor),
                                  onPressed: () => null,
                                )
                              ],
                            ),
                            TopCategoryList(),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LeftLayoutWidget extends StatelessWidget {
  LeftLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.1) -
        ((MediaQuery.of(context).size.width * 0.1) * 2 / 7);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: containerWidth,
            child: TopLayoutWidget(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: containerWidth,
            child: HeaderLayoutWidget(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: containerWidth,
            child: MiddleLayoutWidget(),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: containerWidth,
            child: BottomLayoutWidget(),
          ),
        )
      ],
    );
  }
}

class HeaderLayoutWidget extends StatelessWidget {
  HeaderLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20) * 3 / 12);

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomCard(
                  child: Text('BLUE'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomCard(
                  child: Text('BROWN'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomCard(
                  child: Text('PINK'),
                ),
              ),
            ),
          ),
        ]);
  }
}

class MiddleLayoutWidget extends StatelessWidget {
  MiddleLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20) * 3 / 12);

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              'Title',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        child: Text('CYAN'),
                      )),
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        color: Color(menuBackgroundColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Weekly Balance',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(menuTextColor),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    visualDensity:
                                        VisualDensity.adaptivePlatformDensity,
                                    icon: Icon(LineAwesomeIcons.ellipsis_h),
                                    color: Color(buttonColor),
                                    onPressed: () => null,
                                  )
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  '16040.35',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(creditColor),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: LiquidLinearProgressIndicator(
                                  value: 0.75,
                                  valueColor: AlwaysStoppedAnimation(
                                      Color(menuSelectedIconColor)),
                                  backgroundColor: Color(menuTextColor),
                                  borderRadius: 12.0,
                                  direction: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ]),
              ),
            ),
          ),
        ]);
  }
}

class BottomLayoutWidget extends StatelessWidget {
  BottomLayoutWidget();

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20) * 5 / 12);

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              'Title',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        child: Text('Graph'),
                      )),
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              'Title',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: CustomCard(
                        child: Text('RED'),
                      )),
                    ]),
              ),
            ),
          ),
        ]);
  }
}

class TopLayoutWidget extends StatelessWidget {
  TopLayoutWidget();

  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed(loginRoute)
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = (MediaQuery.of(context).size.height - 20) -
        ((MediaQuery.of(context).size.height - 20) * 1 / 12);

    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomCard(
                  child: Text('Search'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: containerHeight,
              // decoration: BoxDecoration(
              //   color: Colors.amber,
              // ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.0,
                  children: [
                    ChoiceChip(
                      label: Text("Last week"),
                      selected: true,
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    ChoiceChip(
                      label: Text("Last month"),
                      selected: false,
                    ),
                    ChoiceChip(
                      label: Text("Last year"),
                      selected: false,
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      icon: Icon(LineAwesomeIcons.bell),
                      color: Color(buttonColor),
                      onPressed: () => null,
                    ),
                    IconButton(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      icon: Icon(LineAwesomeIcons.sign_out),
                      color: Color(buttonColor),
                      onPressed: () => _goToLogin(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}
