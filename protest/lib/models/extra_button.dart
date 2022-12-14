import 'package:flutter/material.dart';

class ExtraButton {
  final String run;
  final Color activeTextColor;
  final Color inActiveTextColor;
  final Color activeBackgroundColor;
  final Color inActiveBackgroundColor;
  var state = false;

  ExtraButton({
    required this.run,
    required this.activeTextColor,
    required this.inActiveTextColor,
    required this.activeBackgroundColor,
    required this.inActiveBackgroundColor,
  });
}