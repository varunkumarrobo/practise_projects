import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/persons.dart';
import './screens/home_screen.dart';
import './screens/add_person_screen.dart';
import 'screens/edit_person_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Persons(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          AddPersonScreen.routeName: (context) => const AddPersonScreen(),
          EditPersonScreen.routeName: (context) => const EditPersonScreen(),
        },
      ),
    );
  }
}
