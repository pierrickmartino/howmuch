import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key key,
      this.child,
      this.color,
      this.onTap,
      this.padding,
      this.shadowColor,
      this.elevation})
      : super(key: key);

  final Widget child;
  final Color color;
  final Color shadowColor;
  final dynamic Function() onTap;
  final double padding;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: shadowColor ?? Colors.black,
      elevation: elevation ?? 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 10),
          child: child,
        ),
      ),
    );
  }
}
