import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (BuildContext context) => Data(),
      // {
      //   return data;
      // }
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
            // Text(data),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  // final String data;
  // Level1(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {

  // final String data;
  // Level2(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  // final String data;
  // Level3(this.data);
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context,listen: false).data);
  }
}
class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText){
        Provider.of<Data>(context,listen: false).changeString(newText);
      },
    );
  }
}
class Data extends ChangeNotifier{
    String data = "Top Secret Data";

    void changeString(String newString){
      data = newString;
      notifyListeners();
    }
}






