import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: 
          ThemeData.dark().copyWith(
            primaryColor: const Color(0xff0A0E21),
            scaffoldBackgroundColor: const Color(0xff0A0E21),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0A0E21)),
          ),
      home: const InputPage(),
    );
  }
}

