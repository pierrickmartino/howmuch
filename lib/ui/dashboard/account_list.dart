import 'package:flutter/material.dart';
import 'package:howmuch/ui/common/custom_card.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

// import '../../constant/fake_data.dart';
import '../../constant/const.dart';
// import '../../src/model/transaction.dart';

final _numberFormat =
    NumberFormat.currency(locale: 'de_CH', symbol: '', decimalDigits: 2);

class AccountList extends StatelessWidget {
  AccountList({@required this.containerWidth});

  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    return null;
    // AccountListView(
    //     list: FakeData.fakeAccountList, containerWidth: containerWidth);
  }
}

class AccountListView extends StatelessWidget {
  AccountListView({@required this.list, @required this.containerWidth});

  final list;
  final double containerWidth;

  @override
  Widget build(BuildContext transactionListContext) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: this.list.length,
      itemBuilder: (transactionListContext, index) {
        //Transaction transaction = this.list[index];

        return;
        //AccountItem(transaction: transaction, containerWidth: containerWidth);
      },
    );
  }
}

class AccountItem extends StatelessWidget {
  AccountItem({@required this.transaction, @required this.containerWidth});

  final transaction;
  final double containerWidth;

  @override
  Widget build(BuildContext transactionItemContext) {
    String transactionDescription, transactionAmount;

    transactionDescription = transaction.description;
    transactionAmount = _numberFormat.format(transaction.amount);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 160.0,
              height: 80.0,
              child: CustomCard(
                color: Color(menuBackgroundColor),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '* * * TOTA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(menuTextColor),
                        ),
                      ),
                      Icon(
                        LineAwesomeIcons.google_wallet,
                        color: Color(menuTextColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: ((containerWidth - 70) * 0.4 * 0.9) - 450,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    'CHF  ' + transactionAmount,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Container(
                width: ((containerWidth - 70) * 0.4 * 0.9) - 450,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    transactionDescription,
                    style: TextStyle(
                      color: Color(buttonColor),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
