import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Stack App'),
          ),
        ),
        body: SingleChildScrollView(
          // child: SizedBox(
          //   width: 300,
          //   height: 300,
            child: Center(
              child: Row(
                children: [
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.hardEdge,
                        alignment: AlignmentDirectional.bottomCenter,
                        textDirection: TextDirection.rtl,
                        fit: StackFit.passthrough,
                        children: <Widget>[
                          Container(
                            height: 300.0,
                            width: 411.0,
                            color: Colors.teal,
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.topRight,
                            child: const Text('Cont 1'),
                          ),
                          Container(
                            height: 200.0,
                            width: 200.0,
                            color: Colors.purpleAccent,
                            padding: const EdgeInsets.all(15.0),
                            alignment: Alignment.topRight,
                            child: const Text('Cont 2'),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            //color: Colors.white,
                            padding: const EdgeInsets.all(15.0),
                            alignment: Alignment.bottomRight,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg"),
                              ),
                            ),
                            child: const Text(
                                'Cont 3',
                              style: TextStyle(color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                          //)
                        ],
                      ),
                      Row(
                        children: [Container(
                          height: 3000.0,
                          width: 20.0,
                          color: Colors.yellow,
                        ),
                          Container(
                          height: 3000.0,
                          width: 200.0,
                          color: Colors.red,
                        ),
                          Container(
                            height: 3000.0,
                            width: 20.0,
                            color: Colors.yellow,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          //),
        ),
      ),
    );
  }
}
