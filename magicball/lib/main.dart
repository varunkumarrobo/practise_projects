import 'package:flutter/material.dart';
import 'dart:math';

void main() =>
    runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            title: Center(
              child: Text('Ask Me Anything'),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Magicball(),
        ),
      ),
    );

class Magicball extends StatefulWidget {
  //const MaterialApp({Key? key}) : super(key: key);

  @override
  _MagicballlState createState() => _MagicballlState();
}

class _MagicballlState extends State<Magicball> {
  int ballnumber = 1;

  @override
  Widget build(BuildContext context) {
    pressButton() {
      print('I Got Clicked');
      setState(() {
        ballnumber = Random().nextInt(5) +
            1; // count from 0 so we added +1 to achieve 0+1 = 1// count from 0 so we added +1 to achieve 0+1 = 1
      });
    }
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: pressButton,
              //print('I got Clicked');
              child: Image.asset('images/ball$ballnumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}



