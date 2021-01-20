// // // https://quicktype.io
// // //
// // // To parse this JSON data, do
// // //
// // //     final transaction = transactionFromJson(jsonString);

// // import 'dart:convert';

// // List<Transaction> transactionFromJson(String str) => List<Transaction>.from(
// //     json.decode(str).map((x) => Transaction.fromJson(x)));

// // String transactionToJson(List<Transaction> data) =>
// //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Transaction {
//   String id;
//   String product;
//   String iban;
//   String transactionId;
//   String description1;
//   String description2;
//   String description3;
//   String currency;
//   String extraInfo;
//   DateTime valueDate;
//   DateTime transactionDate;
//   DateTime accountingDate;
//   int category;
//   double debitAmount;
//   double creditAmount;
//   double transactionAmount;

//   Transaction(
//       {this.id,
//       this.product,
//       this.iban,
//       this.transactionId,
//       this.description1,
//       this.description2,
//       this.description3,
//       this.currency,
//       this.extraInfo,
//       this.valueDate,
//       this.transactionDate,
//       this.accountingDate,
//       this.category,
//       this.debitAmount,
//       this.creditAmount,
//       this.transactionAmount});
// }

// //   factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
// //         id: json["id"],
// //         objectId: json["objectId"],
// //         description: json["description"],
// //         color: json["color"],
// //         amount: json["amount"],
// //         date: json["date"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "objectId": objectId,
// //         "description": description,
// //         "color": color,
// //         "amount": amount,
// //         "date": date,
// //       };
// // }
