import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pracs/demo1/screens/search.dart';
import 'package:pracs/demo1/screens/home.dart';
import 'package:pracs/demo1/screens/settings.dart';
import 'package:pracs/demo1/screens/chats.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}
class _BaseState extends State<Base> {
  final bool _selectedItem = true;
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void _onArrowButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.music_note),
                title: const Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.videocam),
                title: const Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text('INSTAGRAM',
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),),
          actions:  <Widget>[
            IconButton(onPressed: (){_onArrowButtonPressed();},
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
            color: Colors.black,),
            // Icon(
            //   Icons.keyboard_arrow_down_outlined,size: 40,),
            // FlatButton(
            //   textColor: Colors.white,
            //   onPressed: () {},
            //   shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
            //   child: const Text("Save"),
            // ),
          ],
          // bottom: const TabBar(tabs: [
          //   Tab(
          //     text: "Chat",
          //     icon: Icon(Icons.chat),
          //   ),
          //   Tab(
          //     text: "Chat",
          //     icon: Icon(Icons.chat),
          //   ),
          //   Tab(
          //     text: "Chat",
          //     icon: Icon(Icons.chat),
          //   ),
          // ]),
          leading: InkWell(
            onTap: ()
            {
              _key.currentState!.openDrawer();
            },
            child:const Icon(
              Icons.message,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        body: getBody(_selectedIndex),
        drawer: SafeArea(
          child: Drawer(
            width: double.infinity,
            // elevation: 16.0,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAccountsDrawerHeader(
                    accountName: Text('Varun Kumar'),
                    accountEmail: Text('Varun816@outlook.com'),
                currentAccountPicture: CircleAvatar(radius: 35.0,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRsfn65KCPAM6GNJZ4ZTsJOlFyoT_5BhlmwQ&usqp=CAU'),
                     child: Text("")),),
                // ElevatedButton.icon(onPressed: (){},
                //     icon: const Icon(Icons.arrow_downward),
                //     label: const Text('ABCD')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                  Text('CHATS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ],),
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Chats(charName: 'Mahesh S', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/7465582/pexels-photo-7465582.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Chats(charName: 'Ashlesh', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/1049622/pexels-photo-1049622.jpeg?auto=compress&cs=tinysrgb&w=400'),
                        Chats(charName: 'Ankitha S', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/932263/pexels-photo-932263.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Chats(charName: 'Ankitha R', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/932261/pexels-photo-932261.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Chats(charName: 'Rithika', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/368736/pexels-photo-368736.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Chats(charName: 'Varun', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/10319442/pexels-photo-10319442.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Chats(charName: 'Bhargav', professional: 'Flutter Develpers',
                            imageUrl: 'https://www.shutterstock.com/image-photo/davangere-karnataka-india-july-23-600w-2186723661.jpg'),
                        Chats(charName: 'Vishwa', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/981588/pexels-photo-981588.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Chats(charName: 'Sai P', professional: 'Flutter Develpers',
                            imageUrl: 'https://images.pexels.com/photos/7715526/pexels-photo-7715526.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        // ListTile(
                        //   title: const Text("Home"),
                        //   leading: const Icon(
                        //     Icons.home,
                        //     size: 20,
                        //   ),
                        //   selected: _selectedItem,
                        //   // selectedColor: Colors.orange,
                        //   // selectedTileColor: Colors.orange.shade200,
                        //   onTap: () {
                        //     setState(() {
                        //       _selectedIndex = 0;
                        //     });
                        //     _key.currentState!.closeDrawer();
                        //     //  Navigator.pop(context);
                        //   },
                        // ),
                        // ListTile(
                        //   title: const Text("Profile"),
                        //   leading: const Icon(
                        //     Icons.man,
                        //     size: 20,
                        //   ),
                        //   onTap: () {
                        //     setState(() {
                        //       _selectedIndex = 1;
                        //     });
                        //     Navigator.pop(context);
                        //   },
                        // ),
                        // ListTile(
                        //   title: const Text("Settings"),
                        //   leading: const Icon(
                        //     Icons.settings,
                        //     size: 20,
                        //   ),
                        //   onTap: () {
                        //     setState(() {
                        //       _selectedIndex = 2;
                        //     });
                        //     Navigator.pop(context);
                        //   },
                        // ),
                        // ListTile(
                        //   title: const Text("Help"),
                        //   leading: const Icon(
                        //     Icons.help,
                        //     size: 20,
                        //   ),
                        //   onTap: () {
                        //     setState(() {
                        //       _selectedIndex = 3;
                        //     });
                        //     Navigator.pop(context);
                        //   },
                        // ),
                        // ListTile(
                        //   title: const Text("Logout"),
                        //   leading: const Icon(
                        //     Icons.logout,
                        //     size: 20,
                        //   ),
                        //   onTap: () {
                        //     setState(() {
                        //       _selectedIndex = 4;
                        //     });
                        //     Navigator.pop(context);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
          // unselectedLabelStyle: const TextStyle(color: Colors.black),
          currentIndex: _selectedIndex,
          fixedColor: Colors.teal,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Videos",
              icon: Icon(Icons.personal_video_rounded),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.man),
            ),
          ],
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
  }
getBody(int index) {
  switch (index) {
    case 0:
      return const Home();
    case 1:
      return Search();
    case 2:
      return const Settings();
  }
}

//optional
// Container(
// padding: const EdgeInsets.only(left: 10, top:50 ),
// height: 130,
// width: double.infinity,
// color: Colors.blue,
// child:Row(
// children: const [
// SizedBox(
// height: 80,
// ),
// CircleAvatar(
// radius: 35.0,
// backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_jhEBJCfxdfT55VROVcvkqhUr9WI1oNOJYA&usqp=CAU'),
// //child: Text("AH"),
// ),
// SizedBox(
// width: 10,
// ),
// Text("Angela",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20.0,
// ),)
// ],
// ),
// ),