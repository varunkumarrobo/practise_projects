import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.tealAccent,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
        pressButton(){     //changing Dice Face by pressing single Button
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;// count from 0 so we added +1 to achieve 0+1 = 1
        rightDiceNumber = Random().nextInt(6) + 1;// count from 0 so we added +1 to achieve 0+1 = 1
      });
    }
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //flex: 5,
            child: FlatButton(
              onPressed: pressButton,
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            //flex: 2,
            child: FlatButton(
              onPressed: pressButton,
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

