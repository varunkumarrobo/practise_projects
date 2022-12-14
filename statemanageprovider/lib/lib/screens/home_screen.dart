import 'package:flutter/material.dart';
import 'add_person_screen.dart';
import '../widgets/home_screen_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPersonScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: const HomeScreenListView(),
      ),
    );
  }
}
