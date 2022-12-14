import 'package:flutter/material.dart';
import 'package:untitled1/profile.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade200,
          title: const Text(
              'Recent Calls',
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                //letterSpacing: 2,
              ),
            ),
        ),
        body: Container(
            color: Colors.grey.shade200,
            width: 450.0,
            child: ListView(
              children: const [
                Profile(
                  charName: 'Wentworth Miller',
                  professional: 'American actor',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVXsMJJ5pqgNvQCeMKQfdKDQHbTnUoX0IKkiYRDCqwKyElP00Wkb7TqPUR&s',
                ),
                Profile(
                  charName: 'Dominic Purcell',
                  professional: 'Actor',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZYtbU_C_rMBwpki_qrSyVHwGUngg2LVSZHjua6h0SXOhOeKjlbIqO&usqp=CAE&s',
                ),
                Profile(
                  charName: 'Sarah Wayne',
                  professional: 'American actress',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROh6PrIGus5e8aIAUjeVBTRMfpm2sup_rxW4OLpFSTXZomKWl14ADV&usqp=CAE&s',
                ),
                Profile(
                  charName: 'Narendra Modi',
                  professional: 'Prime Minister of India',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQX9SlwsVpwEz_JbDXUy2A-uQpbkAYprVXk2XWSU4x44ABYve-pmYr&usqp=CAE&s',
                ),
                Profile(
                  charName: 'Virat Kohli',
                  professional: 'Indian cricketer',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwWdR8R2WPKKCKZmB3RNVmqoWIT9CsmVcv4lY6bCCRSA&s',
                ),
                Profile(
                  charName: 'Hazen Audel',
                  professional: 'Television presenter',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-rAClkwJx_blI929o0f3gHjO1v1owvZdjgR2uC5rD4uKBcgciAVAG&usqp=CAE&s',
                ),
                Profile(
                  charName: 'Bear Grylls',
                  professional: 'British adventurer',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUqGjv8swMggB3oKTZjFQW0Ul2rEjZfdP2DDjr2vnYKF1VCt8W43IrIMc_EQ&s',
                ),
                Profile(
                  charName: 'Tom Cruise',
                  professional: 'American actor',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4YjZpyT8cgN2E6LbaKI4--i3d9sA985m-NFDV-8ftvfK0eLtV7jEOjqI9oQ&s',
                ),
                Profile(
                  charName: 'Penélope Cruz',
                  professional: 'Indian cricketer',
                  imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAK0Gsweiw2qqSDEayTxdpWB6qV25K1aKJKjra5zIMRkt6QTUpJKpM&usqp=CAE&s',
                ),
              ],
            )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavigationBar(
            elevation: 50,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            selectedFontSize: 15,
            unselectedFontSize: 15,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.call,
                  color: Colors.red.shade800,
                ),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  color: Colors.red.shade200,
                ),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.red.shade200,
                ),
                backgroundColor: Colors.red,
                label: 'Contact',
              ),
            ],
          ),
        ),
      ),
    );
  }
}