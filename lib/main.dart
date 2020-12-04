import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'config/route/router.dart';
import 'constant/const.dart';

// UNUSED IN FAKE DATA MODE
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'src/graphql/graphql_conf.dart';

//GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
void main() {
  var logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
  if (dataMode == 'fake') {
    logger.w(' Fake Mode ACTIVATED');
  }

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
    //return GraphQLProvider(
    //child:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HowMuch app',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Manrope'),
      initialRoute: loginRoute, //homeRoute,
      onGenerateRoute: CustomRouter.generateRoute,
      //),
      //client: graphQLConfiguration.client,
    );
  }
}
