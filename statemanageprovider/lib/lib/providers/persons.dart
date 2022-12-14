import 'package:flutter/foundation.dart';
import '../models/person.dart';

class Persons with ChangeNotifier {
  final List<Person> _persons = [];

  List<Person> get persons {
    return _persons;
  }

  Person getPerson(String id) {
    return _persons.firstWhere((person) => person.id == id);
  }

  void addPerson(String name, int age) {
    _persons.add(Person(DateTime.now().toString(), name, age));
    notifyListeners();
  }

  void deletePerson(String id) {
    _persons.removeWhere((person) => person.id == id);
    notifyListeners();
  }

  void editPerson(String id, String name, int age) {
    final selectedPerson = _persons.firstWhere((person) => person.id == id);
    final personIndex = _persons.indexOf(selectedPerson);
    _persons.removeAt(personIndex);
    _persons.insert(personIndex, Person(selectedPerson.id, name, age));
    notifyListeners();
  }
}
