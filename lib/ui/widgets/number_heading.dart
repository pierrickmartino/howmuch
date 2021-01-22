import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'responsive.dart';

class NumberHeading extends StatelessWidget {
  const NumberHeading({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 20,
              bottom: 0, //screenSize.height / 20,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Numbers',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        icon: Icon(LineAwesomeIcons.ellipsis_h),
                        onPressed: () => null),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Data statistics that you could be interested in',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 15,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Text(
              'Numbers',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
