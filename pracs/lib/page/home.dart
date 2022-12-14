
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static List<String> message = [
    'Publish tutorial on React Native Firebase',
    'Complete Registration UI',
    'Test reads and writes to Firebase',
    'Add Firebase Login Screen',
    'Let\'s see if this task is great'
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  String currentMessage = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        color: Colors.white,
        title: 'Firebase Clone',
        home: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Center(
              child: Text('Home',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal)),
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(20, 10, 100, 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          currentMessage = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Add new entity',
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(325, 10, 10, 10),
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            minimumSize: const Size(60, 50),
                            backgroundColor: Colors.indigo.shade300),
                        onPressed: (() {
                          setState(() {
                            Home.message.add(currentMessage);
                          });
                        }),
                        child: const Text('Add')),
                  ),
                ],
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: getTextWidgets(Home.message))
            ]),
          ),
        ));
  }
}

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = [];
  for (var i = 0; i < strings.length; i++) {
    list.add(Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          alignment: Alignment.topLeft,
          child: Text('$i.${strings[i]}',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal)),
        ),
        Divider(
          height: 15,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey.shade500,
        )
      ],
    ));
  }
  return Column(children: list);
}