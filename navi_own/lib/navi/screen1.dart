import 'package:flutter/material.dart';
import 'package:navi_own/navi/screen2.dart';


class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: const Text('Go Forwards To Screen 2'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context){
              return Screen2();
            },
                ),);
          },
        ),
      ),
    );
  }
}
