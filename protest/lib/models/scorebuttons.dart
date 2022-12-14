import 'package:flutter/material.dart';

class ScoreButtons extends StatelessWidget {
  ScoreButtons(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
       this.icon,
      required this.size})
      : super(key: key);
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
   IconData? icon;
  double size;

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: backgroundColor,
            // borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: borderColor,
              width: 1.0,
            ),
          shape: BoxShape.circle,
        ),
        // color: Colors.white,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
        ),
      );
  }
}

class WicketsButtons extends StatelessWidget {
  WicketsButtons(
      {Key? key,
        required this.textColor,
        required this.backgroundColor,
        required this.borderColor,
        required this.text,
        this.icon,
        })
      : super(key: key);
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  IconData? icon;
  // double size;

  @override
  Widget build(BuildContext context) {
    return  Container(
      // width: 50,
      height: 20,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        // shape: BoxShape.circle,
      ),
      // color: Colors.white,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
