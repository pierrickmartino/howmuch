import 'package:flutter/material.dart';
import 'package:howmuch/ui/common/transaction_page.dart';

//import '../common/transaction_page.dart';
// import '../auth/authentication.dart';
import '../common/home_page.dart';
import 'auth_dialog.dart';

class HowMuchDrawer extends StatefulWidget {
  const HowMuchDrawer({
    Key key,
  }) : super(key: key);

  @override
  _HowMuchDrawerState createState() => _HowMuchDrawerState();
}

class _HowMuchDrawerState extends State<HowMuchDrawer> {
  // bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //if (userEmail == null)
              Container(
                width: double.maxFinite,
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.blueGrey[800];
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey[700];
                      }
                      return null; // Defer to the widget's default.
                    }),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AuthDialog(),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              // else
              //   Row(
              //     children: [
              // CircleAvatar(
              //   radius: 20,
              //   backgroundImage:
              //       imageUrl != null ? NetworkImage(imageUrl) : null,
              //   child: imageUrl == null
              //       ? const Icon(
              //           Icons.account_circle,
              //           size: 40,
              //         )
              //       : Container(),
              // ),
              //const SizedBox(width: 10),
              // Text(
              //   name ?? userEmail,
              //   style: const TextStyle(
              //     fontSize: 20,
              //     color: Colors.white70,
              //   ),
              // )
              // ],
              // )
              ,
              const SizedBox(height: 20),
              //if (userEmail != null)
              // Container(
              //   width: double.maxFinite,
              //   child: FlatButton(
              //     color: Colors.black,
              //     hoverColor: Colors.blueGrey[800],
              //     highlightColor: Colors.blueGrey[700],
              //     onPressed: _isProcessing
              //         ? null
              //         : () async {
              //             setState(() {
              //               _isProcessing = true;
              //             });
              // await signOut().then((result) {
              //   //print(result);
              //   Navigator.of(context).pushReplacement(
              //     MaterialPageRoute<dynamic>(
              //       fullscreenDialog: true,
              //       builder: (context) => const HomePage(),
              //     ),
              //   );
              // }).catchError((dynamic error) {
              //   print('Sign Out Error: $error');
              // });
              //             setState(() {
              //               _isProcessing = false;
              //             });
              //           },
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //         top: 15,
              //         bottom: 15,
              //       ),
              //       child: _isProcessing
              //           ? const CircularProgressIndicator()
              //           : const Text(
              //               'Sign out',
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 color: Colors.white,
              //               ),
              //             ),
              //     ),
              //   ),
              // )
              //else
              Container(),
              // if (userEmail != null)
              //   const SizedBox(height: 20)
              // else
              Container(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'Overview',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => const TransactionPage()),
                  );
                },
                child: const Text(
                  'Transactions',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Divider(
                  color: Colors.blueGrey[400],
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2020 | HOWMUCH',
                    style: TextStyle(
                      color: Colors.blueGrey[300],
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
