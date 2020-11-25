import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'config/route/router.dart';
import 'constant/const.dart';
import 'src/api/graphQL_conf.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
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
    return GraphQLProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HowMuch app',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Manrope'),
        initialRoute: homeRoute,
        onGenerateRoute: CustomRouter.generateRoute,
      ),
      client: graphQLConfiguration.client,
    );
  }
}
