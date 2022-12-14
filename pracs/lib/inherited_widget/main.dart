// class _InheritedWidgetExampleState extends State<InheritedWidgetExample>{
//   final Random _random = Random();
//   int _score = 10;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Info(
//             score: _score,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.score),
//                 const CurrentScore(),
//               ],
//             ),
//           ),
//           OutlinedButton(
//             child: const Text('Change'),
//             onPressed: () {
//               setState(() {
//                 _score = _random.nextInt(100);
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inherited widget'),
          backgroundColor: Colors.teal,
        ),
        body: InheritedWidgetExample(),
      ),
    );
  }
}

class InheritedWidgetExample extends StatefulWidget {
  @override
  _InheritedWidgetExampleState createState() => _InheritedWidgetExampleState();
}


class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {

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
              children: [
                const Icon(Icons.score),
                CurrentScore(),
              ],
            ),
          ),
          OutlinedButton(
            child: const Text('Change'),
            onPressed: () {
              // score = random.nextInt(100);
              setState(
                () {
                  _score = _random.nextInt(100);
                  // _score = 5;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class Info extends InheritedWidget {
  const Info({
    Key? key,
    required this.score,
    required Widget child,
  })  : super(key: key, child: child);

  final int score;

  static Info? of(BuildContext context) {
    print('Info? of(BuildContext context)');

    return context.dependOnInheritedWidgetOfExactType<Info>();
  }

  @override
  bool updateShouldNotify(covariant Info oldWidget) {
    print('updateShouldNotify');

    // return oldWidget.score != score;
    print(oldWidget.score);
    return false;
  }
}

class CurrentScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CurrentScore rebuilt');
    final Info info = Info.of(context)!;

    return Container(
      child: Text(info.score.toString()),
    );
  }
}