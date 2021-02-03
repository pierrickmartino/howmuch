import 'package:flutter/material.dart';

import 'responsive.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key key,
    this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                const Text(
                  'Trends',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'YTD indicators in relation to last year',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                const SizedBox(height: 10),
              ],
            )
          : Row(
              children: [
                const Text(
                  'Trends',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    'YTD indicators in relation to last year',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ),
              ],
            ),
    );
  }
}
