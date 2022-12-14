//Mahesh's code

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int indexSelected = 0;

   Stream<int> generate() async*{
     await Future<void>.delayed(const Duration(seconds: 2));

     for(int i = 1; i <= 10; i++){
       await Future<void>.delayed(const Duration(seconds: 1));
       yield i;
     }
   }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 601) {
          return HorizontalView();
        } else {
          return VerticalView();
        }
      },
    );
    // return OrientationBuilder(
    //     builder: (context, orientation){
    //       if(orientation == Orientation.landscape){
    //         return HorizontalView();
    //       }else{
    //         return VerticalView();
    //       }
    //     },
    // );
  }

  Widget VerticalView(){
     return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.blue,
           elevation: 0,
           title: Container(
             width: 150,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: const <Widget>[
                 Icon(Icons.favorite_border),
                 Icon(Icons.bookmark_border),
                 Icon(Icons.star_border),
               ],
             ),
           ),
         ),
         body: Container(
           color: Colors.black,
           child: FractionallySizedBox(
             heightFactor: 0.25,
             widthFactor: 0.75,
             child: Container(
               color: Colors.green,
               child: Row(
                 children: [
                   Container(
                     color: Colors.grey,
                     width: MediaQuery.of(context).size.width*0.25,
                     height:  MediaQuery.of(context).size.height*0.50,
                     child: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: const <Widget>[Text('Hello'),Text('World')],
                       ),
                     ),
                   ),
                   AspectRatio(
                       aspectRatio: 1/3,
                   child: Container(
                     color: Colors.red,
                     child: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const <Widget>[Text('Hello'),Text('World')],
                       ),
                     ),
                   ),
                   ),
                   Flexible(child: FractionallySizedBox(
                     heightFactor: 0.5,
                     widthFactor: 0.5,
                     child: Container(
                       color: Colors.pink,),),
                   ),
                   StreamBuilder<int>(
                     stream: generate(),
                       builder: (
                       BuildContext context,
                           AsyncSnapshot<int> snapshot,
                       ){
                       if(snapshot.connectionState == ConnectionState.waiting){
                         return const CircularProgressIndicator();
                       }else if(snapshot.connectionState == ConnectionState.active
                       || snapshot.connectionState == ConnectionState.done){
                         if(snapshot.hasError){
                           return const Text('Error');
                         }else if(snapshot.hasData){
                           return Text(snapshot.data.toString(),
                           style: const TextStyle(
                             color: Colors.red,fontSize: 40,
                           ),);
                         }else {
                           return const Text('Empty data');
                         }
                       }else{
                         return Text('State: ${snapshot.connectionState}');
                       }
                       }),
                 ],
               ),
             )
           ),
         ),
       ),
     );
  }
  Widget HorizontalView(){
     return Scaffold(
       body: Center(
         child: Row(
           children: <Widget>[
             NavigationRail(
                 selectedIndex: indexSelected,
             onDestinationSelected: (int index){
                   indexSelected = index;
                   setState(() {});
             },
             backgroundColor: Colors.purpleAccent,
               destinations:   const [
                 NavigationRailDestination(
                     icon: Icon(Icons.favorite_border),
                     label: Text('First'),
                 selectedIcon: Icon(Icons.favorite),),
                 NavigationRailDestination(
                     icon: Icon(Icons.bookmark_border),
                     label: Text('Second'),
                 selectedIcon: Icon(Icons.book),),
                 NavigationRailDestination(
                     icon: Icon(Icons.star_border),
                     selectedIcon: Icon(Icons.star),
                     label: Text('Third'),),
               ],),
             Padding(padding: const EdgeInsets.only(left: 10),
              child: indexSelected == 0? const Text('Likes'):indexSelected == 1 ?
             const Text('BookMarks'):const Text('star'),),
             SingleChildScrollView(
               child: Column(
                 children: [
                   Card(
                     child: Row(
                       children: [
                         const Text('Without fittedBox',
                         style: TextStyle(fontSize: 25),),
                         Container(
                           height: 200,
                           child: Image.network('https://lh3.googleusercontent.com/-svwfeFI7WnY/XvHmVb955QI/AAAAAAAAHvc/K3JwOtoUkNkalWy_CY9DJRgxfKddCUQswCK8BGAsYHg/s0/Untitled-3.png'),
                         )
                       ],),
                   ),
                   FittedBox(
                     child: Card(
                       child: Row(
                         children: [
                           const Text('Without fittedBox',
                           style: TextStyle(
                             fontSize: 25,
                           ),),
                           Container(
                             height: 200,
                             child: Image.network('https://lh3.googleusercontent.com/-svwfeFI7WnY/XvHmVb955QI/AAAAAAAAHvc/K3JwOtoUkNkalWy_CY9DJRgxfKddCUQswCK8BGAsYHg/s0/Untitled-3.png'),
                           ),
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
       ),
     );
  }
}



