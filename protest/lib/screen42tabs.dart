import 'package:flutter/material.dart';
import 'package:protest/custombutton.dart';

class Screen42tabs extends StatefulWidget {
  const Screen42tabs({Key? key}) : super(key: key);

  @override
  State<Screen42tabs> createState() => _Screen42tabsState();
}

class _Screen42tabsState extends State<Screen42tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 238, 241, 1),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TournamentInputs(
                  tournamentId: 'rmgtr',
                  name: 'Teams',
                  icon: Icons.navigate_next,
                  counts: '6',
                  callBack: () {},
                ),
                TournamentInputs(
                  tournamentId: 'wsgyf',
                  name: 'Overs',
                  icon: Icons.navigate_next,
                  counts: '5',
                  callBack: () {},
                ),
                TournamentInputs(
                  tournamentId: 'wsgyf',
                  name: 'Grounds',
                  icon: Icons.navigate_next,
                  counts: '4',
                  callBack: () {},
                ),
                TournamentInputs(
                  tournamentId: 'wsgyf',
                  name: 'Umpires',
                  icon: Icons.navigate_next,
                  counts: '4',
                  callBack: () {},
                ),
                TournamentInputs(
                  tournamentId: 'wsgyf',
                  name: 'Start Date',
                  icon: Icons.navigate_next,
                  counts: 'Sat, Oct 15 2017',
                  callBack: () {},
                ),
                TournamentInputs(
                  tournamentId: 'wsgyf',
                  name: 'End Date',
                  icon: Icons.navigate_next,
                  counts: 'Sun, Oct 16 2017',
                  callBack: () {},
                ),
                TournamentInputs(
                  tournamentId: 'wsgyf',
                  name: 'Start of Play',
                  icon: Icons.navigate_next,
                  counts: '9.00 AM',
                  callBack: () {},
                ),
                TournamentInputs(
                  tournamentId: 'wsgyf',
                  name: 'End of Play',
                  icon: Icons.navigate_next,
                  counts: '6.00 PM',
                  callBack: () {},
                ),
                GestureDetector(
                  onTap: () {
                    //canceling tournament
                  },
                  child: Container(
                    height: 70,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Cancel Tournament',
                            style: TextStyle(
                              color: Color.fromRGBO(245, 17, 45, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          CustomButton4(text: 'RE-GENERATE FIXTURE', onPressed: () {}),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class TournamentInputs extends StatelessWidget {
  TournamentInputs({
    required this.tournamentId,
    required this.name,
    required this.icon,
    required this.counts,
    required this.callBack,
    Key? key,
  }) : super(key: key);

  final String tournamentId;
  IconData icon;
  final Function callBack;
  final String name;
  final String counts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('Go to screen for Ground $tournamentId');
      },
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    counts,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      callBack();
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color(0xffF5A623),
                      radius: 13,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
