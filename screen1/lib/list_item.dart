import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  late String name;
  late String image;

  ListItem({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(image),
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
