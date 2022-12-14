import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget Doc',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inherited Widget'),
          backgroundColor: Colors.teal,
        ),
        body:  InheritedWidgetE(),
      ),
    );
  }
}

class InheritedWidgetE extends StatefulWidget {

  @override
  State<InheritedWidgetE> createState() => _InheritedWidgetState();
}

class _InheritedWidgetState extends State<InheritedWidgetE> {

  final Random _random = Random();
  int _score = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Info(
            score: _score,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.score),
                  CurrentScore(),
                ],
              ),
          ),
          OutlinedButton(
            onPressed: (){
            setState(() {
              _score = _random.nextInt(100);
            });
           }, child: const Text('Change'),
          ),
        ],
      ),
    );
  }
}

class Info extends InheritedWidget{

  const Info({
     Key? key,
    required this.score,
    required Widget child,
}): assert(score != null),
        assert(child != null),
        super(key: key,child:child);

  final int score;

  static Info? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Info>();
  }

  @override
  bool updateShouldNotify(covariant Info oldWidget){
    return  false;
  }
}

class CurrentScore extends StatelessWidget {
  //const CurrentScore({Key? key}) : super(key: key);

  const CurrentScore();

  @override
  Widget build(BuildContext context) {
    print('CurrentScore rebuilt');
    final Info info = Info.of(context)!;

    return Container(
      child: Text(info.score.toString()),
    );
  }
}
