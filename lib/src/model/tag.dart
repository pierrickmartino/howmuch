// https://quicktype.io
//
// To parse this JSON data, do
//
//     final tag = tagFromJson(jsonString);

import 'dart:convert';

List<Tag> tagFromJson(String str) =>
    List<Tag>.from(json.decode(str).map((x) => Tag.fromJson(x)));

String tagToJson(List<Tag> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tag {
  String objectId;
  String name;
  int color;
  String users;
  String categories;

  Tag({this.objectId, this.name, this.color, this.users, this.categories});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        objectId: json["objectId"],
        name: json["name"],
        color: json["color"],
        users: json["users"],
        categories: json["categories"],
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "name": name,
        "color": color,
        "users": users,
        "categories": categories,
      };
}
