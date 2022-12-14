import 'package:flutter/material.dart';
import 'package:pracs/page/padd.dart';

class MyForm extends StatefulWidget{
  TextEditingController myController=TextEditingController();
  String label;
  FormFieldValidator<String> callBack;
  MyForm({required this.myController,required this.label,required this.callBack, required String? Function(dynamic value) validate});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFormState();
  }

}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    String label=widget.label;
    // TODO: implement build
    return TextFormField(
      controller: widget.myController,
      decoration:  InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white70,
          labelText: widget.label),
      validator: widget.callBack,
      onSaved: (email) {
        print("object");
      },
    ).all(20,20,25,0);
  }
}