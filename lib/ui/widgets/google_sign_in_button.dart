import 'package:flutter/material.dart';

// import '../auth/authentication.dart';
// import '../common/home_page.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({Key key}) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.blueGrey, width: 3),
        ),
        color: Colors.white,
      ),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blueGrey[100]),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.blueGrey[200];
            }
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return null; // Defer to the widget's default.
          }),
        ),
        onPressed: () async {
          setState(() {
            _isProcessing = true;
          });
          // await signInWithGoogle().then((result) {
          //   //print(result);
          //   if (result != null) {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute<dynamic>(
          //         fullscreenDialog: true,
          //         builder: (context) => const HomePage(),
          //       ),
          //     );
          //   }
          // }).catchError((dynamic error) {
          //   print('Registration Error: $error');
          // });
          setState(() {
            _isProcessing = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: _isProcessing
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blueGrey,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('asset/images/google_logo.png'),
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
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
