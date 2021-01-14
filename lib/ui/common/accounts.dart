import 'package:fluid_layout/fluid_layout.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../../constant/const.dart';

class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Color(backgroundColor),
        child: FluidLayout(
          child: Builder(
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 6),
                  Fluid(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(menuBackgroundColor),
                        borderRadius: BorderRadius.all(Radius.circular(
                                5.0) //         <--- border radius here
                            ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(menuBackgroundColor),
                            blurRadius: 10,
                            spreadRadius: 0.01,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            'Accounts',
                            style: TextStyle(
                              color: Color(menuTextColor),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            tooltip: 'New account',
                            icon: Icon(
                              LineAwesomeIcons.plus,
                              size: 16,
                              color: Color(menuTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
