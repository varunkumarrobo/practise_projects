import 'package:flutter/material.dart';
import 'package:protest/custombutton.dart';
import 'main.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
     _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) =>
                      Onboarding_content(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                        pageIndex: _pageIndex,),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
      CustomButton4(text: 'Let\'s Start', onPressed: (){
        if(_pageIndex == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> const MyHomePage(title: 'Hi',)));
        } else{
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
        }
      }),
    );
  }
}



class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: isActive? 12:4,
        width: 4,
        decoration: BoxDecoration(
          color: isActive? const Color.fromRGBO(250, 113, 113, 1):
          const Color.fromRGBO(250, 113, 113, 0.5),
          // borderRadius:  BorderRadius.all(Radius.circular(12),),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class Onboard{
  final String image,title,description;

  Onboard({
    required this.image,
    required this.title,
    required this.description});
}

final List<Onboard> demo_data = [
  Onboard(image: 'assets/images/welcomeInfog.png',
      title: 'Welcome to Cric Champs!',
      description: 'Your one stop app for Creating and managing your own cricket tournaments and share it with your viewers.'),
  Onboard(image: 'assets/images/pagesecnd.png',
      title: 'Create & Manage Tournaments',
      description: 'Create Fixtures by inputting teams, grounds, umpires, overs etc. and manage them thereafter.'),
  Onboard(image: 'assets/images/pagethrd.png',
      title: 'View Tournaments',
      description: 'Use Tournament code to get access for viewing live scores and updates of a tournament.'),
];



class Onboarding_content extends StatelessWidget {
    Onboarding_content({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
      required this.pageIndex
  }) : super(key: key);

  final String image,title,description;

  int pageIndex ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
        height: 280,),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(demo_data.length, (index) =>
                  Padding(padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(isActive: index == pageIndex,),),),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
            fontSize: 20,letterSpacing: 0.5,
          color: Color.fromRGBO(74, 74, 74, 1),),
        ),
        const SizedBox(height: 16,),
          Padding(
           padding: const EdgeInsets.only(left: 18.0,right: 18.0),
             child: Text(
               description,
            style: const TextStyle(
            color: Color.fromRGBO(74, 74, 74, 1),
             fontSize: 16,
              ),
               textAlign: TextAlign.center,),
              ),
        const Spacer(),
      ],
    );
  }
}


// Onboard(image: 'assets/images/cricket-ball.jpeg',
//     title: 'ashlesh',
//     description: 'hfghergf'),
//Your one stop app for Creating and managing your own cricket tournaments and share it with your viewers.

// Padding(
//   padding: const EdgeInsets.only(bottom: 30),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       ...List.generate(demo_data.length, (index) =>
//           Padding(padding: const EdgeInsets.only(right: 4),
//           child: DotIndicator(isActive: index == _pageIndex,),),),
//     ],
//   ),
// ),
// const Spacer(),
// SizedBox(height: 60,width: 60,
// child:
// ElevatedButton(onPressed: (){
// },
//     style: ElevatedButton.styleFrom(
//       shape: const CircleBorder(),
//     ),
//     child: const Icon(Icons.arrow_forward)),
// ),
// _pageController.nextPage(
// duration: const Duration(milliseconds: 300),
// curve: Curves.ease);

// Theme.of(context)
//   .textTheme
//   .headline5!
//   .copyWith(fontWeight: FontWeight.w500),