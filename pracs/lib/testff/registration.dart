import 'package:flutter/material.dart';

class Registration extends StatelessWidget{
  TextEditingController _nameController = TextEditingController();

  Registration({Key? key}) : super(key: key);
  //TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller : _nameController,
            onChanged : (value)
            {
              print(value);
            },
            decoration : const InputDecoration(
              hintText : "Your Name",
              labelText : "Name",
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}