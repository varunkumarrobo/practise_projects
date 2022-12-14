import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protest/Screen43&44.dart';
import 'package:protest/commedummy.dart';
import 'package:protest/droptime.dart';
import 'package:protest/screen42tabs.dart';
import 'package:protest/success_tournament.dart';
import 'package:protest/upDate_liveScore_page.dart';
import 'custombutton.dart';
import 'dummy.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}







class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'demo',),
      // IntroSliderPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                         const UpdateLiveScore()));
              },
              icon: const Icon(Icons.skip_next,
              size: 50,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=> const Screen42tabs()));
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 13,
                    child: Icon(Icons.navigate_next,color: Colors.white,)
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:
                            (context)=>  const TabBarDemo()));
                  },
                  child: const CircleAvatar(
                      backgroundColor: Color(0xffF5A623),
                      radius: 13,
                      child: Icon(Icons.navigate_next,color: Colors.white,)
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:
                            (context)=> const SuccessTournament()));
                  },
                  child: const CircleAvatar(
                      backgroundColor: Color(0xffF5A623),
                      radius: 13,
                      child: Icon(Icons.navigate_next,color: Colors.white,),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:
                            (context)=> const Screen43()));
                  },
                  child: const CircleAvatar(
                      backgroundColor: Color(0xffF5A623),
                      radius: 13,
                      child: Icon(Icons.navigate_next,color: Colors.white,)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap:  ()  {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>
                  const Commentary()));
                },
              child: const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 13,
                  child: Icon(Icons.navigate_next,color: Colors.white,)
              ),
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder:
                        (context)=> const ManageDurationScreen()));
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 13,
                child: Icon(Icons.navigate_next,color: Colors.white,)
            ),),
          ],
        ),
      ),
    );
  }
}


//
// int _counter = 0;
// void _incrementCounter() {
//   setState(() {
//     _counter++;
//   });
// }


// floatingActionButton: FloatingActionButton(
//   onPressed: _incrementCounter,
//   tooltip: 'Increment',
//   child: const Icon(Icons.add),
// ), // This trailing comma makes auto-formatting nicer for build methods.

// Screen(),
// Text(
//   '$_counter',
//   style: Theme.of(context).textTheme.headline4,
// ),

// import 'package:flutter/material.dart';
// import 'package:intro_slider/dot_animation_enum.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';
// import 'home.dart';

// class IntroSliderPage extends StatefulWidget {
//   @override
//   _IntroSliderPageState createState() => _IntroSliderPageState();
// }

// class _IntroSliderPageState extends State<IntroSliderPage> {
//   List<Slide> slides = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     slides.add(
//       new Slide(
//         title: "Hello Food!",
//         description:
//         "The easiest way to order food from your favorite restaurant!",
//         pathImage: "assets/images/hamburger.png",
//       ),
//     );
//     slides.add(
//        Slide(
//         title: "Movie Tickets",
//         description: "Book movie tickets for your family and friends!",
//         pathImage: "assets/images/movie.png",
//       ),
//     );
//     slides.add(
//       Slide(
//         title: "Great Discounts",
//         description: "Best discounts on every single service we offer!",
//         pathImage: "assets/images/discount.png",
//       ),
//     );
//     slides.add(
//       Slide(
//         title: "World Travel",
//         description: "Book tickets of any transportation and travel the world!",
//         pathImage: "assets/images/travel.png",
//       ),
//     );
//   }
//
//   List<Widget> renderListCustomTabs() {
//     List<Widget> tabs = [];
//     for (int i = 0; i < slides.length; i++) {
//       Slider currentSlide = slides[i];
//       tabs.add(
//         Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Container(
//             margin: EdgeInsets.only(bottom: 160, top: 60),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                   child: Image.asset(
//                     currentSlide.pathImage.toString(),
//                     matchTextDirection: true,
//                     height: 60,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20),
//                   child: Text(
//                     currentSlide.title.toString(),
//                     style: TextStyle(color: Colors.white, fontSize: 25),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 30,
//                   ),
//                   child: Text(
//                     currentSlide.description.toString(),
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       height: 1.5,
//                     ),
//                     maxLines: 3,
//                     textAlign: TextAlign.center,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   margin: EdgeInsets.only(
//                     top: 15,
//                     left: 20,
//                     right: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//     return tabs;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       backgroundColorAllSlides: Colors.green[700],
//       renderSkipBtn: Text("Skip"),
//       renderNextBtn: Text(
//         "Next",
//         style: TextStyle(color: Colors.green[700]),
//       ),
//       renderDoneBtn: Text(
//         "Done",
//         style: TextStyle(color: Colors.green[700]),
//       ),
//       colorDoneBtn: Colors.white,
//       colorActiveDot: Colors.white,
//       sizeDot: 8.0,
//       typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
//       listCustomTabs: this.renderListCustomTabs(),
//       scrollPhysics: BouncingScrollPhysics(),
//       onDonePress: () => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => MyHomePage(title: 'Hi',),
//         ),
//       ),
//     );
//   }
// }

// class IntroSliderDemo extends StatefulWidget {
//   const IntroSliderDemo({Key? key}) : super(key: key);
//
//   @override
//   _IntroSliderDemoState createState() => _IntroSliderDemoState();
// }
//
// class _IntroSliderDemoState extends State<IntroSliderDemo> {
//   List<Slidable> slides = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       slides: slides,
//       colorActiveDot: Colors.white,
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     slides.add(
//       Slide(
//         title: "Management",
//         description:
//         'Management is the administration of an organization, whether it is a business,'
//             ' a non-profit organization, or a government body. ',
//         pathImage: "assets/onboarding0.png",
//         heightImage: 370,
//         widthImage: 400,
//         backgroundColor: const Color(0xff4266AC),
//       ),
//     );
//     slides.add(
//       Slide(
//         title: "Chat",
//         description:
//         "Chat refers to the process of communicating, interacting and/or exchanging messages over the Internet. "
//             "It involves two or more individuals that communicate through a chat-enabled service or software. ",
//         pathImage: "assets/onboarding1.png",
//         heightImage: 370,
//         widthImage: 400,
//         backgroundColor: const Color(0xff3852B2),
//       ),
//     );
//     slides.add(
//       Slide(
//         title: "Leadership",
//         description:
//         "Leadership is the ability of an individual or a group of individuals to influence and guide followers or other members of an organization.  ",
//         pathImage: "assets/onboarding2.png",
//         heightImage: 370,
//         widthImage: 400,
//         backgroundColor: const Color(0xff2A78E6),
//       ),
//     );
//   }
// }