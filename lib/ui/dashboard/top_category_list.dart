import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:howmuch/src/model/transaction.dart';

class TopCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Faker faker = Faker();
    List<Transaction> fakeTransactionList = List.generate(
        5,
        (index) => Transaction(
              id: faker.guid.guid(),
              objectId: faker.guid.guid(),
              description: faker.sport.name(),
              color: faker.randomGenerator.integer(4300000000, min: 4200000000),
              amount: faker.randomGenerator.integer(10000),
              date: null, //faker.date.dateTime(),
            ),
        growable: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CategoryList(list: fakeTransactionList),
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

    transactionDescription = transaction.description;
    transactionAmount = transaction.amount.toString();

    return ListTile(
      minVerticalPadding: 2,
      dense: true,
      title: Text(transactionDescription, style: TextStyle(fontSize: 14)),
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
