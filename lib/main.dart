import 'package:flutter/material.dart';

import 'config/route/router.dart';
import 'constant/const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HowMuch app',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Manrope'),
      initialRoute: homeRoute,
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
