import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constant/const.dart';
import '../../ui/common/home_page.dart';
import '../../ui/common/transaction_page.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case transactionsRoute:
        return MaterialPageRoute(
          builder: (_) => TransactionPage(),
        );
      // case loginRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => LoginScreen(),
      //   );
      // case homeRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => Home(),
      //   );
      // case accountsRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => Accounts(),
      //   );
      // case transactionsRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => Transactions(),
      //   );
      // case categoriesRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => Categories(),
      //   );
      // case filtersRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => Filters(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
