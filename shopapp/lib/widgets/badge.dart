import 'package:flutter/material.dart';

class Badge extends StatelessWidget{
   Badge({
    required this.child,
    required this.value,
  });

  final Widget child;
  final String value;
  //  final Color color;
  
  @override
  Widget build(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      child,
      Positioned(
        right: 8,
        top: 8,
        child:  Container(
          padding: const EdgeInsets.all(2.0),
          //color: Theme.of(context).accentcolor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).colorScheme.secondary,
            //  color != null ? color:Theme.of(context).colorScheme.secondary,
          ),
          constraints: const BoxConstraints(
            maxHeight: 16,
            minWidth:16,
             ),
             child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
             ),
          ),
        ),
    ],
  );
  }

}