import 'package:flutter/material.dart';
import 'package:navi_own/navi/screen1.dart';


class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: const Text('Go Back To Screen 1'),
          onPressed: () {
            Navigator.pop(context,MaterialPageRoute(builder: (context){
              return Screen1();
            }));
          },
        ),
      ),
    );
  }
}
