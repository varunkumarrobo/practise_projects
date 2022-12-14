

import 'package:flutter/cupertino.dart';
import '../constants.dart';


class BottomButton extends StatelessWidget {
  const BottomButton({
    required this.onTap,required this.buttonTitle
  });

  final Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        color: kbottomContainerColour,
        // const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        child:  Center(
          child: Text(buttonTitle,
            style: klargeButtonStyle,),
        ),
      ),
    );
  }
}