import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart'; // https://pub.dev/packages/collapsible_sidebar
import 'package:howmuch/ui/common/dashboard.dart';

import 'accounts.dart';
import 'categories.dart';
import 'filters.dart';
import 'transactions.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<CollapsibleItem> _items;
  NetworkImage _avatarImg =
      NetworkImage('https://www.w3schools.com/howto/img_avatar.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
  }

  Widget _showContent(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return Dashboard();
        break;
      case 1:
        return Accounts();
      case 2:
        return Transactions();
      case 3:
        return Categories();
      case 4:
        return Filters();
      default:
        return Home();
    }
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.assessment,
        onPressed: () => setState(() => _selectedIndex = 0),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Accounts',
        icon: Icons.cancel,
        onPressed: () => setState(() => _selectedIndex = 1),
      ),
      CollapsibleItem(
        text: 'Transactions',
        icon: Icons.search,
        onPressed: () => setState(() => _selectedIndex = 2),
      ),
      CollapsibleItem(
        text: 'Categories',
        icon: Icons.notifications,
        onPressed: () => setState(() => _selectedIndex = 3),
      ),
      CollapsibleItem(
        text: 'Filters',
        icon: Icons.settings,
        onPressed: () => setState(() => _selectedIndex = 4),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: CollapsibleSidebar(
        items: _items,
        avatarImg: _avatarImg,
        title: 'John Smith',
        body: _body(size, context),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: _showContent(
          _selectedIndex), //Text('selectedIndex: $_selectedIndex'),
    );
  }
}
