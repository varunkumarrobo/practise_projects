import 'package:flutter/material.dart';

class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Login Help',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text('Find Your account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            SizedBox(height: 15,),
            Text('Enter Your username or the email or phone number linked to your account.'),
            SizedBox(
              height: 40,
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
