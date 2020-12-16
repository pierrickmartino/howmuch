import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../../constant/fake_data.dart';
import '../../constant/const.dart';
import '../../src/model/transaction.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);

class TopCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CategoryList(list: FakeData.fakeCategoryList),
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({@required this.list});

  final list;

  @override
  Widget build(BuildContext transactionListContext) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: this.list.length,
      itemBuilder: (transactionListContext, index) {
        Transaction transaction = this.list[index];

        return CategoryItem(transaction: transaction);
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({@required this.transaction});

  final transaction;

  @override
  Widget build(BuildContext transactionItemContext) {
    String transactionDescription, transactionAmount;
    Color colorAmount;

    transactionDescription = transaction.description;
    transactionAmount = _numberFormat.format(transaction.amount);
    colorAmount =
        transaction.amount < 0 ? Color(debitColor) : Color(creditColor);

    return ListTile(
      leading: Icon(
        LineAwesomeIcons.gift,
        color: Color(buttonColor),
        size: 20,
      ),
      minVerticalPadding: 0,
      dense: true,
      title: Text(transactionDescription,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      trailing: Text(
        'CHF  ' + transactionAmount,
        style: TextStyle(fontWeight: FontWeight.bold, color: colorAmount),
      ),
    );
  }
}
