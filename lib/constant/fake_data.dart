import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class FakeData {
  // Fake Category
  static Faker faker = Faker();
  static int a = 3;
  //static int b = 3;

  //var tList = List.generate(a, (i) => List(b), growable: false);
  var categoryList =
      List.generate(a, (i) => [faker.company.name(), 0, 0], growable: false);
  //print(tList);
}
