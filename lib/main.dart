import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:responsive_framework/responsive_framework.dart'; // https://pub.dev/packages/responsive_framework

import 'config/routes/router.dart';
import 'config/routes/locator.dart';
import 'constants/const.dart';
import 'database/database.dart';

void main() {
  setupLocator();
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
    return RepositoryProvider<AppDatabase>(
      create: (context) => constructDb(),
      child: BlocProvider<TodoAppBloc>(
        create: (context) {
          final db = RepositoryProvider.of<AppDatabase>(context);
          return TodoAppBloc(db);
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'moor Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: HomeScreen(),
        ),
      ),
    );

    // return MultiProvider(
    //     providers: [
    //       Provider(
    //         create: (_) => locator<CategorieDao>(),
    //       ),
    //       Provider(create: (_) => locator<TagDao>()),
    //     ],
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       initialRoute: homeRoute,
    //       title: Constants.appName,
    //       ,
    //       onGenerateRoute: CustomRouter.generateRoute,
    //     ));
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
