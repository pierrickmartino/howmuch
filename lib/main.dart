import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'config/route/router.dart';
import 'constant/const.dart';
import 'plugin/desktop/desktop.dart';
import 'src/bloc/category.dart';
import 'src/database/database.dart';
import 'src/model/dashboard_filter.dart';

void main() {
  var logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
  if (dataMode == 'fake') {
    logger.w(' Fake Mode ACTIVATED');
  }

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DashboardFilter()),
        RepositoryProvider<Database>(
            create: (context) => constructDb(logStatements: false)),
        BlocProvider<HowMuchAppBloc>(
          create: (context) {
            final db = RepositoryProvider.of<Database>(context);
            return HowMuchAppBloc(db);
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HowMuch app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        initialRoute: homeRoute, // loginRoute | homeRoute,
        onGenerateRoute: CustomRouter.generateRoute,
      ),
    );
  }
}
