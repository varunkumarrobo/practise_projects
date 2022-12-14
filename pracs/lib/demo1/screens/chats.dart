import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats(
      {required this.charName,
        required this.professional,
        required this.imageUrl,
        Key? key})
      : super(key: key);
  final String? charName;
  final String? professional;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.fromLTRB(20,5,20,10),
      color: Colors.white,
      child: SizedBox(
        height: 80,
      //  padding: const EdgeInsets.all(1),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage("$imageUrl"),
              radius: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$charName',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$professional',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 25, child: Icon(Icons.call),),
            const SizedBox(width: 15,)
          ],
        ),
      ),
    );
  }
}