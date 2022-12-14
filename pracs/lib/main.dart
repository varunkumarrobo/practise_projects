import 'package:flutter/material.dart';

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
      home:  MyHomePage(),
    );
  }
}
//title: 'Flutter Demo Home Page'
class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  //final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
 bool _secureText = true;
 final TextEditingController _nameController = TextEditingController();
 final TextEditingController _descriptionController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
 var _passwordError;
 final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nameController,
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
              const SizedBox(height: 8),
              TextField(
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
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText:
                    "password should contain 8 characters",
                    labelText: "Password",
                    errorText: _passwordError,
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    border: const OutlineInputBorder(),
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
                        // onChanged: (inputValue){
                        //   if(inputValue.isEmpty || _passwordController.(inputValue)){
                        //     _passwordError(true);
                        //   } else{
                        //     _passwordError(false);
                        //   }
                        // },
                          decoration: const InputDecoration(
                            hintText: "password should contain 8 characters",
                            labelText: "Password",
                            // errorText: null,
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            border: const OutlineInputBorder(),
                      ),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        // validator: (value){
                        //    if(value?.length <= 4)
                        //     return "Enter at least 8 chaacters";
                        //    else
                        //      return  null;
                        // },
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
                setState(() {
                  print("Form validation :${_formKey.currentState!.validate()}");
                  if(_passwordController.text.length < 4) {
                    _passwordError = "Enter at least 8 chaacters";
                  } else {
                    _passwordError = null;
                  }
                });
              }),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

