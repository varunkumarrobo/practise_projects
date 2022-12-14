import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/persons.dart';
import 'home_screen_list_item.dart';

class HomeScreenListView extends StatelessWidget {
  const HomeScreenListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final persons = Provider.of<Persons>(context).persons;
    // print(persons);
    return ListView.builder(
      itemBuilder: (context, index) => HomeScreenListItem(persons[index]),
      itemCount: persons.length,
    );
  }
}
