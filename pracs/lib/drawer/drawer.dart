import 'package:flutter/material.dart';
import 'package:pracs/drawer/home.dart';
import 'package:pracs/drawer/logout.dart';
import 'package:pracs/drawer/padding.dart';
import 'package:pracs/drawer/profilr.dart';
import 'package:pracs/drawer/setting.dart';
import 'package:pracs/drawer/splash.dart';
import 'package:pracs/drawer/help.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  AnimatedSplashScreen(
          duration: 3000,
          splash: Icons.format_list_bulleted,
          nextScreen: const MyHomePage(title: 'My Home page',),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blueGrey),
    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String title = "OnE";
  double padding = 14;
  final bool _selectedItem = true;
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: InkWell(
          onTap: ()
              {
                _key.currentState!.openDrawer();
              },
         child:const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
      ),
      body: getBody(_selectedIndex),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 50),
              height: 220,
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Row(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisAlignment: MainAxisAlignment.center,
                   children: const [
                     SizedBox(
                       height: 80,
                     ),
                     CircleAvatar(
                       radius: 35.0,
                       backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_jhEBJCfxdfT55VROVcvkqhUr9WI1oNOJYA&usqp=CAU'),
                       //child: Text("AH"),
                     ),
                     SizedBox(
                       width: 10,
                     ),
                     Text("Angela",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0,
                     ),)
                   ],
                 ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("+91 9620208254",style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  const [
                      SizedBox(
                        width: 220,
                      ),
                      Icon(
                          Icons.keyboard_arrow_down_outlined,size: 40,),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      leading: const Icon(Icons.home,size: 20),
                      onTap: (){
                        setState(() {
                          _selectedIndex=0;
                        });
                        Navigator.pop(context);
                      },
                      selected: _selectedItem,
                      // selectedColor: Colors.deepOrangeAccent,
                      // selectedTileColor: Colors.orange.shade500,
                    ),//Text("Home").all(_padding),
                    ListTile(
                      title: const Text("Profile"),
                      leading: const Icon(Icons.person,size: 20),
                      onTap: (){
                        setState(() {
                          _selectedIndex=1;
                        });
                        Navigator.pop(context);
                      },
                      selected: _selectedItem,
                      // selectedColor: Colors.pink,
                      // selectedTileColor: Colors.pink.shade500,
                    ),//Text("Profile").all(padding),
                    ListTile(
                      title: const Text("Settings"),
                      leading: const Icon(Icons.settings,size: 20),
                      onTap: (){
                        setState(() {
                          _selectedIndex=2;
                        });
                        Navigator.pop(context);
                      },
                      selected: _selectedItem,
                      // selectedColor: Colors.indigo,
                      // selectedTileColor: Colors.indigoAccent,
                    ),//Text("Settings").all(padding),
                    ListTile(
                      title: const Text("Help"),
                      leading: const Icon(Icons.help_outlined,size: 20),
                      onTap: (){
                        setState(() {
                          _selectedIndex=3;
                        });
                        Navigator.pop(context);
                      },
                      selected: _selectedItem,
                      // selectedColor: Colors.lightBlue,
                      // selectedTileColor: Colors.lightBlueAccent,
                    ),//Text("Help").all(padding),
                    ListTile(
                      title: const Text('Logout'),
                      leading: const Icon(Icons.logout,size: 20),
                      onTap: (){
                        setState(() {
                          _selectedIndex=4;
                        });
                        Navigator.pop(context);
                      },
                      selected: _selectedItem,
                      // selectedColor: Colors.yellow,
                      // selectedTileColor: Colors.yellowAccent,
                    ),//Text("Logout").all(padding),
                  ],
                ),
              ),
            ),),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home),
              ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
                Icons.person),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(
                Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Help",
            icon: Icon(
                Icons.help_outlined),
          ),
          BottomNavigationBarItem(
            label: "Logout",
            icon: Icon(
                Icons.logout),
          ),
        ],
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  getBody(int index){
    switch (index){
      case 0:
        return MyHome();
      case 1:
        return MyProfile();
      case 2:
        return MySetting();
      case 3:
        return MyHelp();
      case 4:
        return MyLogout();
    }
  }
}