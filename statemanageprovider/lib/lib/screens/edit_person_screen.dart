import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider_trial/providers/persons.dart';
import '../models/person.dart';
import '../providers/persons.dart';

class EditPersonScreen extends StatefulWidget {
  const EditPersonScreen({Key? key}) : super(key: key);

  static const routeName = './edit';

  @override
  State<EditPersonScreen> createState() => _EditPersonScreenState();
}

class _EditPersonScreenState extends State<EditPersonScreen> {
   String? _name;
  int? _age;
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    String personId = ModalRoute.of(context)!.settings.arguments as String;
    final person = Provider.of<Persons>(context, listen: false).getPerson(personId);
    // print(person.name);

    _name = person.name;
    _age = person.age;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() {
                    _name = newValue!;
                  });
                },
              ),
              TextFormField(
                initialValue: '$_age',
                decoration: const InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Age is required';
                  } else if (int.tryParse(value) == null) {
                    return 'Age must be number';
                  } else if (int.parse(value) <= 0) {
                    return 'Age is invalid';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() {
                    _age = int.parse(newValue!);
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<Persons>(context, listen: false).editPerson(personId, _name!, _age!);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Edit Person'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
