// https://quicktype.io
//
// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  String objectId;
  String name;
  int color;
  int icon;
  String iconfamily;
  String iconpackage;

  Category(
      {this.objectId,
      this.name,
      this.color,
      this.icon,
      this.iconfamily,
      this.iconpackage});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        objectId: json["objectId"],
        name: json["name"],
        color: json["color"],
        icon: json["icon"],
        iconfamily: json["iconfamily"],
        iconpackage: json["iconpackage"],
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "name": name,
        "color": color,
        "icon": icon,
        "iconfamily": iconfamily,
        "iconpackage": iconpackage,
      };
}
