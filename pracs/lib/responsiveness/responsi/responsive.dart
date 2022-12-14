


import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileeBody;
  final Widget dekstopBody;

  ResponsiveLayout({required this.mobileeBody,required this.dekstopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
      if (constraints.maxWidth < 601){
        return mobileeBody;
      }else {
        return dekstopBody;
      }
    });
  }
}
