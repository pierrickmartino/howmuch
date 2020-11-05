import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../utils/ui/accounts.dart';
import '../../utils/ui/home.dart';
import '../../utils/ui/transactions.dart';
import '../../utils/ui/categories.dart';
import '../../utils/ui/filters.dart';
import '../../constants/const.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case loginRoute:
      //   return MaterialPageRoute(builder: (_) => RootPage(auth: new Auth()));
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
