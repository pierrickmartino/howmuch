import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:howmuch/constant/const.dart';
import 'package:howmuch/src/model/transaction.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:intl/intl.dart';

final _dateFormat = DateFormat.yMMMd();
final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: 'CHF', decimalDigits: 2);

class TopTransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();
    List<Transaction> fakeTransactionList = List.generate(
        5,
        (index) => Transaction(
              id: faker.guid.guid(),
              objectId: faker.guid.guid(),
              description: faker.company.name(),
              color: faker.randomGenerator.integer(4300000000, min: 4200000000),
              amount: faker.randomGenerator.integer(10000),
              date: faker.date.dateTime(
                  minYear: 2020, maxYear: 2021), //faker.date.dateTime(),
            ),
        growable: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TransactionList(list: fakeTransactionList),
      ],
    );
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
    String transactionDescription, transactionAmount, transactionDate;

    transactionDescription = transaction.description;
    transactionAmount = _numberFormat.format(transaction.amount);
    transactionDate = _dateFormat.format(transaction.date);

    return ListTile(
      leading: Icon(
        LineAwesomeIcons.gift,
        color: Color(buttonColor),
        size: 20,
      ),
      minVerticalPadding: 0,
      //contentPadding: EdgeInsets.all(0),
      dense: true,
      title: Text(transactionDescription,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      subtitle: Text(transactionDate,
          style: TextStyle(fontSize: 12, color: Color(buttonColor))),
      trailing: Text(transactionAmount),
    );
  }
}
