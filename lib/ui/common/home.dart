import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart'; // https://pub.dev/packages/collapsible_sidebar
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'accounts.dart';
import 'categories.dart';
import 'filters.dart';
import 'transactions.dart';
import 'dashboard.dart';
import '../../constant/const.dart';

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
        icon: LineAwesomeIcons.binoculars,
        onPressed: () => setState(() => _selectedIndex = 0),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Accounts',
        icon: LineAwesomeIcons.briefcase,
        onPressed: () => setState(() => _selectedIndex = 1),
      ),
      CollapsibleItem(
        text: 'Transactions',
        icon: LineAwesomeIcons.retweet,
        onPressed: () => setState(() => _selectedIndex = 2),
      ),
      CollapsibleItem(
        text: 'Categories',
        icon: LineAwesomeIcons.tags,
        onPressed: () => setState(() => _selectedIndex = 3),
      ),
      CollapsibleItem(
        text: 'Filters',
        icon: LineAwesomeIcons.filter,
        onPressed: () => setState(() => _selectedIndex = 4),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(backgroundColor), //Colors.blueGrey[50],
      body: CollapsibleSidebar(
          items: _items,
          backgroundColor: Color(menuBackgroundColor),
          unselectedIconColor: Color(menuTextColor),
          unselectedTextColor: Color(menuTextColor),
          toggleButtonIcon: LineAwesomeIcons.chevron_circle_right,
          selectedIconBox: Color(menuSelectedIconBoxColor),
          selectedTextColor: Color(menuSelectedTextColor),
          selectedIconColor: Color(menuSelectedIconColor),
          avatarImg: _avatarImg,
          title: 'John Smith',
          body: _body(size, context),
          iconSize: 30.0,
          textSize: 16.0,
          minWidth: 70,
          maxWidth: 200,
          screenPadding: 6,
          borderRadius: 15),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      //decoration: myBoxDecoration(),
      height: double.infinity,
      width: double.infinity,
      child: _showContent(_selectedIndex),
    );
  }
}

// myBoxDecoration() {
//   return BoxDecoration(
//     color: Color(backgroundColor), //Colors.blueGrey[50],
//     border: Border(
//       left: BorderSide(
//         //                   <--- left side
//         color: Color(menuSeparatorColor),
//         width: 2.0,
//       ),
//     ),
//   );
// }
