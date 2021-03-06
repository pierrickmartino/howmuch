import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howmuch/src/bloc/bloc.dart';

class CategoryAddDialog extends StatefulWidget {
  const CategoryAddDialog({Key key}) : super(key: key);
  @override
  _CategoryAddDialogState createState() => _CategoryAddDialogState();
}

class _CategoryAddDialogState extends State<CategoryAddDialog> {
  TextEditingController textControllerCategory;
  FocusNode textFocusNodeCategory;
  bool _isEditingCategory = false;

  final bool _isLoggingIn = false;

  String loginStatus;
  Color loginStringColor = Colors.green;

  String _validateCategory(String value) {
    value = value.trim();

    if (textControllerCategory.text != null) {
      if (value.isEmpty) {
        return "Category can't be empty";
      } else if (!value.contains(
        RegExp(r"^[a-zA-Z0-9]+"),
      )) {
        return 'Enter a correct category';
      }
    }

    return null;
  }

  @override
  void initState() {
    textControllerCategory = TextEditingController();
    textControllerCategory.text = null;
    textFocusNodeCategory = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: 400,
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'CATEGORY',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1.color,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 8),
                  child: Text(
                    'New category',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle2.color,
                      fontSize: 18,
                      // fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    focusNode: textFocusNodeCategory,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: textControllerCategory,
                    onChanged: (value) {
                      setState(() {
                        _isEditingCategory = true;
                      });
                    },
                    onSubmitted: (value) {
                      textFocusNodeCategory.unfocus();
                    },
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey[800],
                          width: 3,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.blueGrey[300],
                      ),
                      hintText: 'Category',
                      fillColor: Colors.white,
                      errorText: _isEditingCategory
                          ? _validateCategory(textControllerCategory.text)
                          : null,
                      errorStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Container(
                          width: double.maxFinite,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey[800]),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.blueGrey[900];
                                }
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.black;
                                }
                                return null; // Defer to the widget's default.
                              }),
                            ),
                            onPressed: () {
                              setState(() {
                                textFocusNodeCategory.unfocus();
                              });

                              if (textControllerCategory.text.isNotEmpty) {
                                BlocProvider.of<HowMuchAppBloc>(context)
                                    .createCategory(
                                        textControllerCategory.text);
                              }

                              textControllerCategory.text = '';
                              _isEditingCategory = false;

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:
                                      Text('category successfully created'),
                                ),
                              );

                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                              ),
                              child: _isLoggingIn
                                  ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Text(
                                      'Save',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Container(
                          width: double.maxFinite,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey[800]),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.blueGrey[900];
                                }
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.black;
                                }
                                return null; // Defer to the widget's default.
                              }),
                            ),
                            onPressed: () {
                              setState(() {
                                textFocusNodeCategory.unfocus();
                              });

                              textControllerCategory.text = '';
                              _isEditingCategory = false;

                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                              ),
                              child: _isLoggingIn
                                  ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (loginStatus != null)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        loginStatus,
                        style: TextStyle(
                          color: loginStringColor,
                          fontSize: 14,
                          // letterSpacing: 3,
                        ),
                      ),
                    ),
                  )
                else
                  Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
