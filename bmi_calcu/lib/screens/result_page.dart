import 'package:bmi_calcu/constants.dart';
import 'package:bmi_calcu/components/reusablecard.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../deviceinfo/info.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.bmiResult, required this.resultText,
    required this.interpretation}) : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Deviceinfo()));
            },
            shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
            child: const Text("Info"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                  color: kactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                       Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                       Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child:  Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                  onpress: () {})),
          BottomButton(buttonTitle:'RE-CALCULATE',
            onTap: () {
            Navigator.pop(context);
            },)
        ],
      ),
    );
  }
}
