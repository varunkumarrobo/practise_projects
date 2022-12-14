import 'package:flutter/material.dart';
import 'package:pracs/testff/home.dart';
import 'package:pracs/testff/form.dart';
import 'package:pracs/testff/registration.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
//title: 'Flutter Demo Home Page'
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool _secureText = true;
  // TextEditingController _nameController = TextEditingController();
  // TextEditingController _descriptionController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  //var _passwordError;
  final _formKey = GlobalKey<FormState>();
  //var quiz = GlobalKey<Registration>();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestField'),
      ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.lightBlueAccent,
          child: getPage(index),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        fixedColor: Colors.green,
        items: const [
          BottomNavigationBarItem(label: "Home",
            icon: Icon(Icons.home),),
          BottomNavigationBarItem(label: "Add",
            icon: Icon(Icons.add),),
          BottomNavigationBarItem(label: "Info",
            icon: Icon(Icons.info),),
          BottomNavigationBarItem(label: "Registration",
            icon: Icon(Icons.app_registration),),
        ],
        onTap: (int tappedIndex) {
          setState(() {
            index = tappedIndex;
          });
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  getPage(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(key: _formKey, child: FormData()),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    _formKey.currentState!.reset();
                  }
                  setState(() {});
                },
                child: const Text("Submit"),
              ),
            ]);
      case 2: return const Text("This App takes user data and displays it"
      );
      case 3: return Registration();
    }
  }
}

/***
    TextField(
    controller: _nameController,
    decoration: InputDecoration(
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
    SizedBox(height: 8),
    TextField(
    controller: _descriptionController,
    decoration: InputDecoration(
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
    SizedBox(height: 8),
    TextField(
    controller: _passwordController,
    decoration: InputDecoration(
    hintText:
    "password should contain 8 characters",
    labelText: "Password",
    errorText: _passwordError,
    labelStyle: TextStyle(
    fontSize: 20,
    color: Colors.black,
    ),
    border: OutlineInputBorder(),
    suffixIcon: IconButton(
    icon: Icon(_secureText? Icons.remove_red_eye :Icons.security),
    onPressed: () {
    setState(() {
    _secureText = !_secureText;
    });
    },
    )
    ),
    keyboardType: TextInputType.visiblePassword,
    obscureText: _secureText,
    maxLength: 8,
    ),
    Form(
    key: _formKey,
    child: Column(
    children: [
    TextFormField(
    decoration: InputDecoration(
    hintText: "password should contain 8 characters",
    labelText: "Password",
    // errorText: null,
    labelStyle: TextStyle(
    fontSize: 20,
    color: Colors.black,
    ),
    border: OutlineInputBorder(),
    ),
    obscureText: true,
    ),
    SizedBox(
    height: 8,
    ),
    TextFormField(
    decoration: InputDecoration(
    hintText: "password should contain 8 characters",
    labelText: "Password",
    // errorText: null,
    labelStyle: TextStyle(
    fontSize: 20,
    color: Colors.black,
    ),
    border: OutlineInputBorder(),
    ),
    obscureText: true,
    ),
    ],
    ),
    ),
    RaisedButton(onPressed: (){
    print('Name ${_nameController.text}');
    print('Description ${_descriptionController.text}');
    print('Password ${_passwordController.text}');
    //_formKey.currentState!.validate();
    // setState(() {
    //   print("Form validation :${_formKey.currentState!.validate()}");
    //   if(_passwordController.text.length < 4)
    //     _passwordError = "Enter at least 8 chaacters";
    //   else
    //     _passwordError = null;
    // });
    }),
 ***/