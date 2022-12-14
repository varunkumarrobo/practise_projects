import 'package:flutter/material.dart';
import 'package:quizzler/quiz/question.dart';
import 'package:quizzler/quiz/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKepper = [
    // Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
    // Icon(
    //   Icons.close,
    //   color: Colors.red,
    // ),
  ];

  void checkAnswer(bool userPickedAnswer){
    bool correctanswers = quizBrain.getCorrectAnswer();
    setState(() {
      if(quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'you\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKepper = [];
      }else{
        if( userPickedAnswer == correctanswers){
          scoreKepper.add(Icon(
            Icons.check,
            color: Colors.green,
          ),);
        }else{
          scoreKepper.add(Icon(
            Icons.close,
            color: Colors.red,
          ),);
        }
        quizBrain.nextQuestion();
      }
      // print(questionNumber);
      // scoreKepper.add(
      //   Icon(Icons.close,
      //     color: Colors.red,
      //   ),
    });
  }
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [false,true,true,false,true,true];
  //
  // Question q1 = Question(q: 'You can lead a cow down stairs but not up stairs.',a:false );
  // int questionNumber =0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // 'This is where the question text will go.',
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                // bool correctanswers = quizBrain.getCorrectAnswer();
                // if(correctanswers == true){
                //   print("user got it right");
                // }else{
                //   print("user got it wrong");
                // }
                //the user picked true.
                // setState(() {
                //   scoreKepper.add(
                //     Icon(
                //       Icons.check,
                //       color: Colors.green,
                //     ),
                //   );
                // });
                // setState(() {
                //   quizBrain.nextQuestion();
                //   // questionNumber = questionNumber + 1;
                //   // print(questionNumber);
                // });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKepper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/