// https://quicktype.io
//
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String objectId;
  String username;
  String password;
  String email;

  User({this.objectId, this.username, this.password, this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
        objectId: json["objectId"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "username": username,
        "password": password,
        "email": email,
      };
}
