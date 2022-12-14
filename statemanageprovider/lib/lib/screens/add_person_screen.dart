import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/persons.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({Key? key}) : super(key: key);

  static const routeName = '/add';

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  String? _name;
  int? _age;
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Person'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
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
                    Provider.of<Persons>(context, listen: false).addPerson(_name!, _age!);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add Person'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
