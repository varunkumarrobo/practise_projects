import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Commentary extends StatefulWidget {
  const Commentary({Key? key}) : super(key: key);

  @override
  State<Commentary> createState() => _CommentaryState();
}

class _CommentaryState extends State<Commentary> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final Map<String, String> commentary =
  {
    '0': "Right Up in the Good Length Much Better Ball",
    '1': 'Keeps the strike by slicing down to deep point',
    '2': 'He has lumped this down the ground. Its a two for Striker',
    '3': "When He Hits It, It Stays Hit",
    '4': "That's a Proper Cricket Shot, Its a Four",
    '6': "That is sensationally vast! He's a Better Player Than His Statistics Suggest,Its a Six ",
    'Wd': 'Bowls a Wide!!!!',
    'NB': 'No Ball!!',
    'Bye': 'More valuable runs, it goes very fine and no-one can cut it off!',
    'Lb': 'Starts leg side, leg byes',
    'Hit Wicket': 'Ah. runs but striker is out hit-wicket',
    'Stumped': 'Got him, a stumping off the pads!!!Goes flat.',
    'Run Out': "he ran the single easily but wanted a second which didn't exist.",
    'Bowled': "He's Bowling a Good Line and Length",
    'LBW': ' It was far too quick for him and its a LBW',
    'Caught': "That's Caught Out, Straight Down the Fielder's Throat",
    'Other': 'xx',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: ScrollController(),
          itemBuilder: (BuildContext context, int index){
            return const CommentaryCard(
              oversCount: '5.1',
              runs: '0',
              commentary: 'Deepanjan to Ashley, 4 runs! Its a beautiful stroke Straight through the covers!',
             );
          },
        itemCount: 3,
          ),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}


class CommentaryCard extends StatelessWidget {
  const CommentaryCard({
    required this.oversCount,
    required this.runs,
    required this.commentary,
    Key? key,
  }) : super(key: key);

  final String oversCount;
  final String runs;
  final String commentary;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.32,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      oversCount,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      runs,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.57,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  commentary,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(102, 102, 102, 1),
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

