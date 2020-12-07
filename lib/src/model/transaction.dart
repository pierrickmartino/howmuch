// https://quicktype.io
//
// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(
    json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  String id;
  String objectId;
  String description;
  int color;
  int amount;
  DateTime date;

  Transaction(
      {this.id,
      this.objectId,
      this.description,
      this.color,
      this.amount,
      this.date});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      id: json["id"],
      objectId: json["objectId"],
      description: json["description"],
      color: json["color"],
      amount: json["amount"],
      date: json["date"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "objectId": objectId,
        "description": description,
        "color": color,
        "amount": amount,
        "date": date,
      };
}
