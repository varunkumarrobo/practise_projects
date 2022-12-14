import 'package:flutter/material.dart';
import 'package:protest/screen16tabs.dart';
import 'package:protest/screen42tabs.dart';

import 'models/batsmancard.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with TickerProviderStateMixin {

  changeBattingItems() {
    setState(() {
      mostRuns = !mostRuns;
    });
  }

  changeBowlingItems() {
    setState(() {
      mostWickets = !mostWickets;
    });
  }

  static bool mostRuns = false;
  static bool mostWickets = false;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.music_note)),
                  Tab(icon: Icon(Icons.music_video)),
                  Tab(icon: Icon(Icons.camera_alt)),
                  Tab(icon: Icon(Icons.grade)),
                  Tab(icon: Icon(Icons.email)),
                ],
              ), // TabBar
              title: const Text('GeeksForGeeks'),
              backgroundColor: Colors.green,
            ), // AppBar
            body: TabBarView(
              children: [
                const Screen42tabs(),
                Screen16Tabs(
                  changeMostRuns: changeBattingItems,
                  changeBowlingItems: changeBowlingItems,
                ),
                const Icon(Icons.grade),
                const Icon(Icons.grade),
                const Icon(Icons.email),
              ],
            ), // TabBarView
          ),
        ),
        mostRuns
            ? Scaffold(
                backgroundColor: Colors.black.withOpacity(0.5),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            mostRuns = !mostRuns;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white),
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.95,
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Column(
                              children: const [
                                MostRunsCard(
                                  batsmanName: 'Batsman',
                                  matches: 'M',
                                  runs: 'R',
                                  isTitle: true,
                                  strikeRate: 'SR',
                                ),
                              ],
                            );
                          }
                          return MostRunsCard(
                            batsmanName: 'Varun (RCB)',
                            matches: '${index}',
                            runs: '${index}',
                            strikeRate: '100',
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        mostWickets
            ? Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      mostWickets = !mostWickets;
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.95,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Column(
                        children:   const [
                          BowlingCard(
                              bowlerName: 'Bowler',
                              wickets: 'W',
                              matches: 'M',
                              average: 'Avr',
                          isTitle: true,),
                        ],
                      );
                    }
                    return BowlingCard(
                        bowlerName: 'Ashelsh (CSK)',
                        wickets: '${index}',
                        matches: '${index}',
                        average: '13.27');
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        )
            : const SizedBox(),
      ],
    );
  }
}







// Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     Row(
//       children: const [
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             'Choose Fielder',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             'Choose Fielder',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16),
//           ),
//         ),
//       ],
//     ),
//     const Divider(
//       height: 3,
//       thickness: 1,
//       color: Color(0xffff3f3f3),
//     ),
//     Expanded(
//       child: ListView.builder(
//         padding: const EdgeInsets.all(0),
//         itemBuilder: (BuildContext context, int index) {
//           return Column(
//             children: [
//               Row(
//                 children: const [
//                   Text('Sashikanth D'),
//                   Spacer(),
//                   Text('Sashikanth D'),
//                 ],
//               ),
//               const Divider(
//                 height: 3,
//                 thickness: 1,
//                 color: Color(0xffff3f3f3),
//               ),
//             ],
//           );
//         },
//         itemCount: 10,
//       ),
//     )
//   ],
// ),
