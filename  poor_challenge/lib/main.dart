import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(
            child: Text('NS_200'),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(
          child: Image(
            image: AssetImage('image/mask.png'),
          ),
        ),
      ),
    ),
  );
}
