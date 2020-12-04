import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../ui/auth/login_screen.dart';
import '../../ui/common/accounts.dart';
import '../../ui/common/home.dart';
import '../../ui/common/transactions.dart';
import '../../ui/common/categories.dart';
import '../../ui/common/filters.dart';
import '../../constant/const.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case accountsRoute:
        return MaterialPageRoute(builder: (_) => Accounts());
      case transactionsRoute:
        return MaterialPageRoute(builder: (_) => Transactions());
      case categoriesRoute:
        return MaterialPageRoute(builder: (_) => Categories());
      case filtersRoute:
        return MaterialPageRoute(builder: (_) => Filters());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
