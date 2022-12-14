import 'package:flutter/material.dart';
import 'package:pracs/google_maps/screens/places_screens.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Maps Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const PlacesScreen(),
    );
  }
}
