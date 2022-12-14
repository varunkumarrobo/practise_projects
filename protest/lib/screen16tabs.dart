import 'package:flutter/material.dart';


class Screen16Tabs extends StatefulWidget {
   Screen16Tabs({Key? key,
     required this.changeMostRuns,
   required this.changeBowlingItems}) : super(key: key);
  Function changeMostRuns;
  Function changeBowlingItems;

  @override
  State<Screen16Tabs> createState() => _Screen16TabsState();
}

class _Screen16TabsState extends State<Screen16Tabs> {

  final List< String> batsmanData = const [
    'Most Runs',
    'Highest Scores',
    'Best Batting Average','Best Batting Strike Rate',
    'Most Hundreds','Most Fifties',
    'Most Fours','Most Sixes',
  ];

  final List< String> bowlerData = const [
    'Most Wickets',
    'Best Bowling Average',
    'Best Bowling',
    'Most 5 Wickets Haul',
    'Best Economy',
    'Best Bowling Strike Rate',
  ];

 @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromRGBO(233, 238, 241, 1),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Batting',
                    style: TextStyle(
                        color: Color(0xFF858585),
                    ),
                  ),
                ),
                 SizedBox(
                   height: 400,
                   width: double.infinity,
                   child: ListView.builder(itemBuilder: (context, index) {
                     return  GestureDetector(
                       onTap: () {
                         setState(() {
                           widget.changeMostRuns();
                         });
                       },
                       child:   Container(
                         height: 70,
                         width: double.infinity,
                         decoration: const BoxDecoration(
                           color: Colors.white,
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(18.0),
                           child: Text(
                             batsmanData[index],
                             overflow: TextOverflow.fade,
                             style: const TextStyle(
                               color: Color.fromRGBO(102, 102, 102, 1),
                               fontSize: 18,
                               fontWeight: FontWeight.w500,
                             ),
                           ),
                         ),
                       ),
                     );
                   },
                     itemCount: batsmanData.length,
                   ),
                 ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Bowling',
                    style: TextStyle(
                        color: Color(0xFF858585)
                    ),),
                ),
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return  GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.changeBowlingItems();
                        });
                      },
                      child:  Container(
                        height: 70,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            bowlerData[index],
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              color: Color.fromRGBO(102, 102, 102, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                    itemCount: bowlerData.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



// class ScreenStatsInputs extends StatefulWidget {
//   const ScreenStatsInputs({
//     required this.tournamentId,
//     required this.name,
//     Key? key,
//   }) : super(key: key);
//
//   final String tournamentId;
//   final String name;
//
//   @override
//   State<ScreenStatsInputs> createState() => _ScreenStatsInputsState();
// }
//
// class _ScreenStatsInputsState extends State<ScreenStatsInputs> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         height: 70,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Text(
//             widget.name,
//             overflow: TextOverflow.fade,
//             style: const TextStyle(
//               color: Color.fromRGBO(102, 102, 102, 1),
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       );
//   }
// }
