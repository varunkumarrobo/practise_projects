import 'package:flutter/cupertino.dart';

extension PaddingExt on Widget {
  all(double left,double right,double top,double bottom) {
    return Padding(
        padding: EdgeInsets.only(left: left, right: right,top:top,bottom: bottom), child: this);
  }
}