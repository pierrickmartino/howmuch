import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/router.dart';
import 'constants/const.dart';
import 'src/database/database.dart';
import 'src/blocs/category.dart';
import 'plugins/desktop/desktop.dart';

void main() {
  //setupLocator();
  setTargetPlatformForDesktop();
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
      child: BlocProvider<HowMuchAppBloc>(
        create: (context) {
          final db = RepositoryProvider.of<AppDatabase>(context);
          return HowMuchAppBloc(db);
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HowMuch app',
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Manrope'),
          initialRoute: homeRoute,
          onGenerateRoute: CustomRouter.generateRoute,
        ),
      ),
    );
  }
}
