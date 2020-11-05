import 'package:flutter/material.dart';

//import 'package:responsive_framework/responsive_framework.dart'; // https://pub.dev/packages/responsive_framework

import 'config/routes/router.dart';
import 'constants/const.dart';

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
      initialRoute: homeRoute,
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: homeRoute,
//       onGenerateRoute: CustomRouter.generateRoute,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         body: SidebarPage(),
//       ),
//     );
//   }
// }
