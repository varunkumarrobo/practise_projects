import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';
import '../profile/profile.dart';
import '../settings/setiings.dart';

class Base extends StatefulWidget {
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  bool _selectedItem = true;
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(_selectedIndex),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://st.depositphotos.com/1001094/3259/i/950/depositphotos_32593135-stock-photo-portrait-of-young-beautiful-fashionable.jpg",
                    height: 50,
                    width: 50,
                  ),
                  Text("MS")
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: new Text("Home"),
                        leading: new Icon(
                          Icons.home,
                          size: 20,
                        ),
                        selected: _selectedItem,
                        selectedColor: Colors.orange,
                        selectedTileColor: Colors.orange.shade200,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                          _key.currentState!.closeDrawer();
                          //  Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: new Text("Profile"),
                        leading: new Icon(
                          Icons.man,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: new Text("Settings"),
                        leading: new Icon(
                          Icons.settings,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: new Text("Help"),
                        leading: new Icon(
                          Icons.help,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: new Text("Logout"),
                        leading: new Icon(
                          Icons.logout,
                          size: 20,
                        ),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 4;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        fixedColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.man),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Help",
            icon: Icon(Icons.help),
          ),
          BottomNavigationBarItem(
            label: "Logout",
            icon: Icon(Icons.logout),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

getBody(int index) {
  switch (index) {
    case 0:
      return Home();
    case 1:
      return Profile();
    case 2:
      return Settings();
  }
}
