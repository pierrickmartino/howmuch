import 'package:howmuch/constant/fake_data.dart';
import 'package:howmuch/ui/common/custom_card.dart';
import 'package:howmuch/ui/dashboard/summary.dart';

import 'responsive.dart';
import 'package:flutter/material.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> asset = [
    'asset/images/trekking.jpg',
    'asset/images/animals.jpg',
    'asset/images/photography.jpeg',
  ];

  final List<String> trends = [
    'INCOME',
    'OUTCOME',
    'SAVINGS',
  ];

  final List<String> title = ['Income', 'Outcome', 'Savings'];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 15),
                  //...Iterable<int>.generate(asset.length).map(
                  ...Iterable<int>.generate(trends.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomCard(
                                    color: Theme.of(context).cardColor,
                                    child: Summary(
                                        widgetType: trends[pageIndex],
                                        amount: FakeData.fakeIncome,
                                        variation:
                                            FakeData.fakeIncomeVariation /
                                                100.0),
                                  ),
                                ),
                                // Image.asset(
                                //   asset[pageIndex],
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //...Iterable<int>.generate(asset.length).map(
                ...Iterable<int>.generate(trends.length).map(
                  (int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child:
                              // Image.asset(
                              //   asset[pageIndex],
                              //   fit: BoxFit.cover,
                              // ),
                              Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CustomCard(
                              color: Theme.of(context).cardColor,
                              child: Summary(
                                  widgetType: trends[pageIndex],
                                  amount: FakeData.fakeIncome,
                                  variation:
                                      FakeData.fakeIncomeVariation / 100.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 70,
                        ),
                        child: Text(
                          title[pageIndex],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1
                                .color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
