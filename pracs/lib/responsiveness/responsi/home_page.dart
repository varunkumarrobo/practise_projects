
import 'package:flutter/material.dart';
import 'package:pracs/responsiveness/responsi/dekstop.dart';
import 'package:pracs/responsiveness/responsi/mobilebody.dart';
import 'package:pracs/responsiveness/responsi/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final currentWidth = MediaQuery.of(context).size.width;
    // backgroundColor: currentWidth < 600 ? Colors.deepPurple[300]: Colors.green[300],
    // body: Center(
    //   child: Text(currentWidth.toString()),
    // ),
    return  Scaffold(
       body: ResponsiveLayout(
           mobileeBody: const MyMobile(),
           dekstopBody: const MyDekstop()),
    );
  }
}
