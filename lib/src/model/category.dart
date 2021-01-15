// // https://quicktype.io
// //
// // To parse this JSON data, do
// //
// //     final category = categoryFromJson(jsonString);

// import 'dart:convert';

// List<Category> categoryFromJson(String str) =>
//     List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

// String categoryToJson(List<Category> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Category {
//   String id;
//   String objectId;
//   String name;
//   int color;
//   int icon;
//   String iconfamily;
//   String iconpackage;
//   int counter;
//   int performance;

//   Category(
//       {this.id,
//       this.objectId,
//       this.name,
//       this.color,
//       this.icon,
//       this.iconfamily,
//       this.iconpackage,
//       this.counter,
//       this.performance});

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         objectId: json["objectId"],
//         name: json["name"],
//         color: json["color"],
//         icon: json["icon"],
//         iconfamily: json["iconfamily"],
//         iconpackage: json["iconpackage"],
//         counter: json["counter"],
//         performance: json["performance"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "objectId": objectId,
//         "name": name,
//         "color": color,
//         "icon": icon,
//         "iconfamily": iconfamily,
//         "iconpackage": iconpackage,
//         "counter": counter,
//         "performance": performance,
//       };
// }
