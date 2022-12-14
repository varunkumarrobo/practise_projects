import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/persons.dart';
import '../models/person.dart';
import '../screens/edit_person_screen.dart';

class HomeScreenListItem extends StatelessWidget {
  const HomeScreenListItem(this.person, {Key? key}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 10),
          Text('Name: ${person.name}'),
          const SizedBox(width: 20),
          Text('Age: ${person.age}'),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                EditPersonScreen.routeName,
                arguments: person.id,
              );
            },
            icon: const Icon(Icons.edit),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Provider.of<Persons>(context, listen: false).deletePerson(person.id);
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
