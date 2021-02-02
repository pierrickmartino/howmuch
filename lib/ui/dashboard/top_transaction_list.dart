// import 'package:flutter/material.dart';
// import 'package:line_awesome_icons/line_awesome_icons.dart';
// import 'package:intl/intl.dart';

// // import '../../constant/fake_data.dart';
// import '../../constant/const.dart';
// // import '../../src/model/transaction.dart';

// final _dateFormat = DateFormat.yMMMd();
// final _numberFormat =
//     NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);

// class TopTransactionList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       // children: [
//       //   TransactionList(list: FakeData.fakeTransactionList),
//       // ],
//     );
//   }
// }

// class TransactionList extends StatelessWidget {
//   TransactionList({@required this.list});

//   final list;

//   @override
//   Widget build(BuildContext transactionListContext) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: this.list.length,
//       itemBuilder: (transactionListContext, index) {
//         //Transaction transaction = this.list[index];

//         return;
//         // TransactionItem(transaction: transaction);
//       },
//     );
//   }
// }

// class TransactionItem extends StatelessWidget {
//   TransactionItem({@required this.transaction});

//   final transaction;

//   @override
//   Widget build(BuildContext transactionItemContext) {
//     String transactionDescription, transactionAmount, transactionDate;
//     Color colorAmount;

//     transactionDescription = transaction.description;
//     transactionAmount = _numberFormat.format(transaction.amount);
//     transactionDate = _dateFormat.format(transaction.date);

//     colorAmount =
//         transaction.amount < 0 ? Color(debitColor) : Color(creditColor);

//     return ListTile(
//       leading: Icon(
//         LineAwesomeIcons.gift,
//         color: Color(buttonColor),
//         size: 20,
//       ),
//       minVerticalPadding: 0,
//       //contentPadding: EdgeInsets.all(0),
//       dense: true,
//       title: Text(
//         transactionDescription,
//         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text(
//         transactionDate,
//         style: TextStyle(
//           fontSize: 12,
//           color: Color(buttonColor),
//         ),
//       ),
//       trailing: Text(
//         'CHF  ' + transactionAmount,
//         style: TextStyle(fontWeight: FontWeight.bold, color: colorAmount),
//       ),
//     );
//   }
// }
