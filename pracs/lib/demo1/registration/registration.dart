import 'package:flutter/material.dart';
import 'package:pracs/demo1/registration/form.dart';
import 'package:pracs/demo1/splash.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController=TextEditingController();
  final gmailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: GestureDetector(
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon(Icons.arrow_back_ios),
              ),
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 35, 0),
          child: Text(
            "Registration",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8B3Dvu2QuqoCNICdEwm6dPf691rO2GTH81w&usqp=CAU',
                height: 100,
                width: 150,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyForm(myController:nameController,label: "Full Name",callBack: (name){
                      if (name != "") {
                        return null;
                      } else {
                        return "Please enter name";
                      }
                    }, validate: (value) {
                      return null;
                    },),
                    MyForm(myController:gmailController,label: "E-mail",callBack: (email){
                      if (email != null && email.contains("@gmail.com")) {
                        return null;
                      } else {
                        return "Please enter valid gmail id";
                      }
                    }, validate: (value) {
                      return null;
                    },),
                    MyForm(myController:passwordController,label: "Password",callBack: (password){
                      if (password!= null && password.length>= 8) {
                        return null;
                      } else {
                        return "Please must be minimum 8 in length";
                      }
                    }, validate: (value) {
                      return null;
                    },),
                    MyForm(myController:confirmController,label: "Confirm Password",callBack: (password){
                      if (password == passwordController.text) {
                        return null;
                      } else {
                        return "Password not matching";
                      }
                    }, validate: (value) {
                      return null;
                    },)
                  ],
                )),
            ElevatedButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: Colors.blueAccent),
                onPressed: (() {
                  _formKey.currentState!.validate();
                  if (_formKey.currentState!.validate()) {
                    print('Account Created');
                    // _formkey.currentState!.save();
                    // _formkey.currentState!.reset();
                    // Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //setState(() {});
                  }
                }),
                child: const Text('Create Account')),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text('Already got an account?'),
            //     ElevatedButton(
            //         style: TextButton.styleFrom(
            //             elevation: 0, backgroundColor: Colors.grey.shade100),
            //         onPressed: () {
            //           Navigator.of(context).pop(
            //             MaterialPageRoute(
            //               builder: (context) => const MyHomePage(title: 'AAA'),
            //             ),
            //           );
            //         },
            //         child: Text('Log in',
            //             style: TextStyle(
            //                 color: Colors.indigo.shade300,
            //                 fontWeight: FontWeight.bold,
            //                 fontStyle: FontStyle.normal))),
            //   ],
            // )
          ]),
        ),
      ),);
  }
}
