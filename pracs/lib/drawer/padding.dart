import 'package:flutter/material.dart';

extension PaddingExt on Widget{
  all(double padding){
    return Padding(padding: EdgeInsets.all(padding),
    child: this,
    );
  }
}