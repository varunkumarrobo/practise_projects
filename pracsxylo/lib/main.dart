import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';



void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    Expanded buildkey(int button, Color col) {
      return Expanded(
        child: FlatButton(
          color: col,
          onPressed: () {
            {
              final player = AudioPlayer();
              player.play(AssetSource('note$button.wav'));
            }
          }, child: Text('Play'),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildkey(1, Colors.redAccent),
              buildkey(2, Colors.tealAccent),
              buildkey(3, Colors.blue),
              buildkey(4, Colors.amber),
              buildkey(5, Colors.deepOrangeAccent),
              buildkey(6, Colors.teal),
              buildkey(7, Colors.green),
              buildkey(8, Colors.blueGrey),
            ],
          ),
        ),
      ),
    );
  }
}





