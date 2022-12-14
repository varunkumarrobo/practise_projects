import 'package:flutter/material.dart';
import 'package:screen1/list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "Grid view";
  bool isList = true;
  List<String> name = [
    "Sachin",
    "Yuvraj",
    "Dinesh",
    "Dhoni",
    "Suresh",
    "Rohit",
    "Virat",
    "Hardik"
  ];
  void _changeView() {
    setState(() {
      isList = !isList;
      if (isList) {
        text = "List view";
      } else {
        text = "Grid view";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: isList
            ? ListView.builder(
            padding: const EdgeInsets.only(bottom: 20.0),
            itemCount: name.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return ListItem(
                name: name[index],
                image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW1pi8QA8OfyoTtJ0_xq8oUJA8AgvNA0ClKA&usqp=CAU",
              );
            })
            : GridView.builder(
            itemCount: name.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1),
            itemBuilder: (BuildContext ctxt, int index) {
              return ListItem(
                name: name[index],
                image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW1pi8QA8OfyoTtJ0_xq8oUJA8AgvNA0ClKA&usqp=CAU",
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeView,
        tooltip: 'Increment',
        child: Text(text),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


