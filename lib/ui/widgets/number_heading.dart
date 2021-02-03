import 'package:flutter/material.dart';
import 'package:howmuch/src/model/period_filter.dart';
import 'package:provider/provider.dart';

import '../../src/model/list_period.dart';
import 'responsive.dart';

class NumberHeading extends StatefulWidget {
  const NumberHeading({Key key, @required this.screenSize}) : super(key: key);

  final Size screenSize;

  @override
  _NumberHeadingState createState() => _NumberHeadingState();
}

class _NumberHeadingState extends State<NumberHeading> {
  final List<ListPeriod> _dropdownItems = [
    ListPeriod(1, 'This month'),
    ListPeriod(2, 'This year'),
    ListPeriod(3, 'All'),
  ];

  List<DropdownMenuItem<ListPeriod>> _dropdownMenuItems;
  ListPeriod _selectedItem;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[2].value;
  }

  List<DropdownMenuItem<ListPeriod>> buildDropDownMenuItems(
      List<dynamic> listItems) {
    final List<DropdownMenuItem<ListPeriod>> items = [];
    for (final ListPeriod listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(listItem.name),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    // si nous voulons passer par des Stateless alors nous devons utiliser le provider
    // pour le moment les periodes ne sont pas transmises à la database
    final _periodValue =
        Provider.of<PeriodFilter>(context).getPeriodFilterForNumbers;

    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
              top: widget.screenSize.height / 20,
              left: widget.screenSize.width / 15,
              right: widget.screenSize.width / 15,
            ),
            width: widget.screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Numbers',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<ListPeriod>(
                          value: _selectedItem,
                          items: _dropdownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value;
                              Provider.of<PeriodFilter>(context, listen: false)
                                  .setPeriodFilterForNumbers(
                                      _selectedItem.value);
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'Data statistics that you could be interested in',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: widget.screenSize.height / 10,
              bottom: widget.screenSize.height / 15,
            ),
            width: widget.screenSize.width,
            // color: Colors.black,
            child: const Text(
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
