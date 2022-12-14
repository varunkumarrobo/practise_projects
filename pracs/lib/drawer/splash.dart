// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
//
//
// class SplashPage extends StatefulWidget{
//   const SplashPage({Key? key,}): super (key: key);
//   final String title;
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage>{
//   @override
//   void initState() {
//     // TODO: implement build
//     super.initState();
//     print('initState');
//     Future.delayed(const Duration(milliseconds: 3000),(){
//       Navigator.push(context, MaterialPageRoute(builder: (context) =>MyHomePage()
//       ));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context){
//     return  const Scaffold(
//       body: Text("Hello RoboSoft",
//       style: TextStyle(
//         color: Colors.pink,
//       ),),
//     );
//   }
// }