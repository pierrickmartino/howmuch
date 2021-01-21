import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// import 'config/route/router.dart';
// import 'constant/const.dart';
//import 'plugin/desktop/desktop.dart';
import 'src/bloc/bloc.dart';
import 'src/database/database.dart';
// import 'src/model/dashboard_filter.dart';
import 'ui/auth/authentication.dart';
import 'ui/common/home_page.dart';

void main() {
  //setTargetPlatformForDesktop();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider.value(value: DashboardFilter()),
        RepositoryProvider<Database>(
            create: (context) => constructDb(logStatements: false)),
        BlocProvider<HowMuchAppBloc>(
          create: (context) {
            final db = RepositoryProvider.of<Database>(context);
            return HowMuchAppBloc(db);
          },
        ),
      ],
      child: DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) {
          return brightness == Brightness.light
              ? ThemeData(
                  primarySwatch: Colors.blueGrey,
                  backgroundColor: Colors.white,
                  cardColor: Colors.blueGrey[50],
                  primaryTextTheme: TextTheme(
                    button: TextStyle(
                      color: Colors.blueGrey,
                      decorationColor: Colors.blueGrey[300],
                    ),
                    subtitle2: TextStyle(
                      color: Colors.blueGrey[900],
                    ),
                    subtitle1: TextStyle(
                      color: Colors.black,
                    ),
                    headline1: TextStyle(
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  bottomAppBarColor: Colors.blueGrey[900],
                  iconTheme: IconThemeData(color: Colors.blueGrey),
                  brightness: brightness,
                )
              : ThemeData(
                  primarySwatch: Colors.blueGrey,
                  backgroundColor: Colors.blueGrey[900],
                  cardColor: Colors.black,
                  primaryTextTheme: TextTheme(
                    button: TextStyle(
                      color: Colors.blueGrey[200],
                      decorationColor: Colors.blueGrey[50],
                    ),
                    subtitle2: TextStyle(
                      color: Colors.white,
                    ),
                    subtitle1: TextStyle(
                      color: Colors.blueGrey[300],
                    ),
                    headline1: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  bottomAppBarColor: Colors.black,
                  iconTheme: IconThemeData(
                    color: Colors.blueGrey[200],
                  ),
                  brightness: brightness,
                );
        },
        themedWidgetBuilder: (context, data) => MaterialApp(
          title: 'Howmuch',
          theme: data,
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(value: DashboardFilter()),
//         RepositoryProvider<Database>(
//             create: (context) => constructDb(logStatements: false)),
//         BlocProvider<HowMuchAppBloc>(
//           create: (context) {
//             final db = RepositoryProvider.of<Database>(context);
//             return HowMuchAppBloc(db);
//           },
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'HowMuch app',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           fontFamily: 'Lato',
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),

//         initialRoute: homeRoute, // loginRoute | homeRoute,
//         onGenerateRoute: CustomRouter.generateRoute,
//       ),
//     );
//   }
// }
