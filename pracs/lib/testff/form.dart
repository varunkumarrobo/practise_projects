import 'package:flutter/material.dart';

class FormData extends StatelessWidget{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  //TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _nameController,
            onChanged: (value)
            {
              print(value);
            },
            decoration: const InputDecoration(
              hintText: "Your Name",
              labelText: "Name",
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: "Details",
              labelText: "Description",
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            obscureText: false,
            maxLines: 3,
            maxLength: 50,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _gmailController,
            decoration: const InputDecoration(
              border:  OutlineInputBorder(),
              labelText: "Enter Mail-id",
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (email)
            {
              if (email != null && email.contains("@mail.com")) {
                return null;
              } else {
                return "Please enter valid gmail id";
              }
            },
            onSaved: (email)
            {},
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "password should contain 8 characters",
              labelText: "Password",
              // errorText: null,
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.visiblePassword,
            maxLength: 8,
            validator: (password){
              if(password != null && password.length >= 8){
                return null;
              }else {
                return "Password must be 8 Characters";
              }},
            onSaved: (password) {print("Save");},
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}