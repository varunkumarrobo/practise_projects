import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base/base.dart';
//import 'package:fulldemo/base/base.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var emailErr = "", passErr = "";

  String email = "mahesh@gmail.com", pass = "123";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Welcome to login",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          errorText: emailErr.isEmpty ? null : emailErr),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          errorText: passErr.isEmpty ? null : passErr),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(),
                        onPressed: () {

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Base()),
                              );
                          // if (isValid()) {
                          //   if (_emailController.text.trim() == email &&
                          //       _passwordController.text.trim() == pass) {
                          //     Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => Base()),
                          //     );
                          //   } else {
                          //     //Show toast, alert,snackbar
                          //   }
                          //   //Navigate to home
                          //
                          // }
                        },
                        child: Text("Login"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isValid() {
    if (_emailController.text.trim().isEmpty) {
      emailErr = "Please enter email";
      setState(() {});
      return false;
    } else if (_passwordController.text.trim().isEmpty) {
      emailErr = "";
      passErr = "Please enter password";
      setState(() {});
      return false;
    }
    emailErr = "";
    passErr = "";
    setState(() {});
    return true;
  }
}
