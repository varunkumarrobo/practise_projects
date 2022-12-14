import 'dart:core';
import 'package:flutter/material.dart';
import 'package:protest/custombutton.dart';
import 'package:protest/models/scorebuttons.dart';
import './models/run_button.dart';
import 'models/extra_button.dart';
import 'models/wickets_button.dart';

enum SampleItem { itemOne, itemTwo, itemThree }
class UpdateLiveScore extends StatefulWidget {
  const UpdateLiveScore({Key? key}) : super(key: key);

  @override
  State<UpdateLiveScore> createState() => _UpdateLiveScoreState();
}

class _UpdateLiveScoreState extends State<UpdateLiveScore> {
  String dropDownValue = 'Item 1';
  SampleItem? selectedMenu;

  List<RunButton> scoreButtons = [
    RunButton(
      run: '0',
      activeTextColor: Colors.white,
      inActiveTextColor: Colors.grey,
      activeBackgroundColor: Colors.grey,
      inActiveBackgroundColor: Colors.white,
    ),
    RunButton(
      run: '1',
      activeTextColor: Colors.white,
      inActiveTextColor: Colors.blue,
      activeBackgroundColor: Colors.blue,
      inActiveBackgroundColor: Colors.white,
    ),
    RunButton(
      run: '2',
      activeTextColor: Colors.white,
      inActiveTextColor: Colors.blue,
      activeBackgroundColor: Colors.blue,
      inActiveBackgroundColor: Colors.white,
    ),
    RunButton(
      run: '3',
      activeTextColor: Colors.white,
      inActiveTextColor: Colors.blue,
      activeBackgroundColor: Colors.blue,
      inActiveBackgroundColor: Colors.white,
    ),
    RunButton(
      run: '4',
      activeTextColor: Colors.white,
      inActiveTextColor: Colors.green,
      activeBackgroundColor: Colors.green,
      inActiveBackgroundColor: Colors.white,
    ),
    RunButton(
      run: '6',
      activeTextColor: Colors.white,
      inActiveTextColor: Colors.green,
      activeBackgroundColor: Colors.green,
      inActiveBackgroundColor: Colors.white,
    ),
  ];

  List<ExtraButton> extraButton = [
    ExtraButton(
        run: 'WD',
        activeTextColor: Colors.white,
        inActiveTextColor: Colors.orange,
        activeBackgroundColor: Colors.orange,
        inActiveBackgroundColor: Colors.white),
    ExtraButton(
        run: 'Nb',
        activeTextColor: Colors.white,
        inActiveTextColor: Colors.orange,
        activeBackgroundColor: Colors.orange,
        inActiveBackgroundColor: Colors.white),
    ExtraButton(
        run: 'Bye',
        activeTextColor: Colors.white,
        inActiveTextColor: Colors.orange,
        activeBackgroundColor: Colors.orange,
        inActiveBackgroundColor: Colors.white),
    ExtraButton(
        run: 'Lb',
        activeTextColor: Colors.white,
        inActiveTextColor: Colors.orange,
        activeBackgroundColor: Colors.orange,
        inActiveBackgroundColor: Colors.white),
  ];

  List<WicketButton> wicketButton =[
    WicketButton(run: 'Hit Wicket',
        activeTextColor: Colors.white,
        inActiveTextColor: const Color.fromRGBO(196, 67, 67, 1),
        activeBackgroundColor: const Color.fromRGBO(196, 67, 67, 1),
        inActiveBackgroundColor: Colors.white),
    WicketButton(run: 'Stumped',
        activeTextColor: Colors.white,
        inActiveTextColor: const Color.fromRGBO(196, 67, 67, 1),
        activeBackgroundColor: const Color.fromRGBO(196, 67, 67, 1),
        inActiveBackgroundColor: Colors.white),
    WicketButton(run: 'Run Out',
        activeTextColor: Colors.white,
        inActiveTextColor: const Color.fromRGBO(196, 67, 67, 1),
        activeBackgroundColor: const Color.fromRGBO(196, 67, 67, 1),
        inActiveBackgroundColor: Colors.white),
    WicketButton(run: 'Bowled',
        activeTextColor: Colors.white,
        inActiveTextColor: const Color.fromRGBO(196, 67, 67, 1),
        activeBackgroundColor: const Color.fromRGBO(196, 67, 67, 1),
        inActiveBackgroundColor: Colors.white),
    WicketButton(run: 'LBW',
        activeTextColor: Colors.white,
        inActiveTextColor: const Color.fromRGBO(196, 67, 67, 1),
        activeBackgroundColor: const Color.fromRGBO(196, 67, 67, 1),
        inActiveBackgroundColor: Colors.white),
    WicketButton(run: 'Caught',
        activeTextColor: Colors.white,
        inActiveTextColor: const Color.fromRGBO(196, 67, 67, 1),
        activeBackgroundColor: const Color.fromRGBO(196, 67, 67, 1),
        inActiveBackgroundColor: Colors.white),
    WicketButton(run: 'Other',
        activeTextColor: Colors.white,
        inActiveTextColor: const Color.fromRGBO(196, 67, 67, 1),
        activeBackgroundColor: const Color.fromRGBO(196, 67, 67, 1),
        inActiveBackgroundColor: Colors.white),
  ];

  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  var raesons = [
    'UDL Strikers didn\'t show up',
    'Paras XI didn\'t show up',
    'Bad Weather',
    'Other'
  ];

  bool fielders = false;
  bool blower = false;
  bool wicketKeeper = false;
  bool stopMatch = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            color: Colors.white,
            //Sinchildscrollview
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const StatusBar(),
                  Container(
                    height: 70,
                    width: double.infinity,
                    color: const Color.fromRGBO(16, 106, 223, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 55),
                          child: Text(
                            "Update Live Score",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Center(
                          child: PopupMenuButton<SampleItem>(
                            icon: const Icon(Icons.more_vert,
                              color: Colors.white,),
                            initialValue: selectedMenu,
                            onSelected: (SampleItem item) {
                              setState(() {
                                selectedMenu = item;
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<SampleItem>>[
                                 PopupMenuItem<SampleItem>(
                                  onTap: (){
                                    stopMatch = !stopMatch;
                                  },
                                  value: SampleItem.itemOne,
                                  child: const Text('Stop Match'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Run Out',
                                  style: TextStyle(
                                    color: Color.fromRGBO(196, 67, 67, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 2.5,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  Text('Wide Ball',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 2.5,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  Text('6 Runs',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: const [
                                  Text('Run Out By Pratik D',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 2.5,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  Text('4 Runs',
                                    style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text('5.5 Overs',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),),
                              SizedBox(height: 5,),
                              Text('10/1',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFF3F3F3),
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 225,
                        width: MediaQuery.of(context).size.width * 0.58,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Runs',
                                style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.87),
                           fontSize: 16,
                               fontWeight: FontWeight.w500
                           ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.only(top: 10,left: 10 , right: 10),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      int i = 0;
                                      for (var button in scoreButtons) {
                                        if (i == index) {
                                          button.state = true;
                                        } else {
                                          button.state = false;
                                        }
                                        i++;
                                      }
                                    });
                                  },
                                  child: ScoreButtons(
                                      textColor: scoreButtons[index].state
                                          ? scoreButtons[index].activeTextColor
                                          : scoreButtons[index].inActiveTextColor,
                                      backgroundColor: scoreButtons[index].state
                                          ? scoreButtons[index].activeBackgroundColor
                                          : scoreButtons[index].inActiveBackgroundColor,
                                      borderColor: scoreButtons[index].activeBackgroundColor,
                                      text: scoreButtons[index].run,
                                      size: 50),
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 2/ 2,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: scoreButtons.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: 225,
                        width: MediaQuery.of(context).size.width * 0.38,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Extras',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.87),
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                            const SizedBox(height: 20,),
                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.only(top: 10,left: 10, right: 5 ),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                    onTap: () {
                                    setState(() {
                                      int i = 0;
                                      for (var button in extraButton) {
                                        if (i == index) {
                                          button.state = true;
                                        } else {
                                          button.state = false;
                                        }
                                        i++;
                                      }
                                      });
                                        },
                                     child: ScoreButtons(
                                      textColor: extraButton[index].state
                                          ? extraButton[index].activeTextColor
                                          : extraButton[index].inActiveTextColor,
                                      backgroundColor: extraButton[index].state
                                          ? extraButton[index].activeBackgroundColor
                                          : extraButton[index].inActiveBackgroundColor,
                                      borderColor: extraButton[index].activeBackgroundColor,
                                      text: extraButton[index].run,
                                      size: 50),
                                ),
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 2/ 2,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: extraButton.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFF3F3F3),
                    height: 2,
                  ),
                  Container(
                    height: 255,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 15,left: 8),
                                child: Text('Wickets',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.87),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GridView.builder(
                            padding: const EdgeInsets.only(top: 20),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                GestureDetector(
                                  onTap: () {
                                     if((index == 2) || (index == 5)){
                                       setState(() {
                                         fielders = !fielders;
                                       });
                                     }if((index == 3) || (index == 4)){
                                       setState(() {
                                         blower = !blower;
                                       });
                                     }
                                     else if(index == 1){
                                       setState(() {
                                         wicketKeeper = !wicketKeeper;
                                       });
                                     }
                                    setState(() {
                                      int i = 0;
                                      for (var button in wicketButton) {
                                        if (i == index) {
                                          button.state = true;
                                        } else {
                                          button.state = false;
                                        }
                                        i++;
                                      }
                                    });
                                  },
                                  child: WicketsButtons(
                                    textColor: wicketButton[index].state
                                        ? wicketButton[index].activeTextColor
                                        : wicketButton[index].inActiveTextColor,
                                    backgroundColor: wicketButton[index].state
                                        ? wicketButton[index].activeBackgroundColor
                                        : wicketButton[index].inActiveBackgroundColor,
                                    borderColor: wicketButton[index].activeBackgroundColor,
                                    text: wicketButton[index].run,
                                  ),
                                ),
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 114,
                              mainAxisSpacing: 12,
                              childAspectRatio: 4.25/2,
                              crossAxisSpacing: 15,
                            ),
                            itemCount: wicketButton.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomButton4(text: 'UPDATE',
              onPressed: () {}),
        ),

        fielders? Scaffold(
          backgroundColor: Colors.black.withOpacity(0.4),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(0),
                child: IconButton(onPressed: () {
                  setState(() {
                    fielders = !fielders;
                  });
                },
                  icon: const Icon(Icons.close,color: Colors.white,),),
              ),
              Container(
                decoration: const BoxDecoration(borderRadius:
                BorderRadius.all(Radius.circular(10)) ,
                    color: Colors.white),
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width*0.95,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Choose Fielder' , style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),),
                      )),
                      const Divider(height: 3,thickness: 1,
                        color: Color(0xffff3f3f3),),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (BuildContext context , int index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: (){},
                                title: const Text('Sashikanth D'),
                              ),
                              const Divider(height: 3,thickness: 1,
                                color: Color(0xFFFf3f3f3),),
                            ],
                          );
                        }, itemCount: 10,),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ):const SizedBox(),

        wicketKeeper? Scaffold(
          backgroundColor: Colors.black.withOpacity(0.4),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(0),
                child: IconButton(onPressed: () {
                  setState(() {
                    wicketKeeper = !wicketKeeper;
                  });
                },
                  icon: const Icon(Icons.close,color: Colors.white,),),
              ),
              Container(
                decoration: const BoxDecoration(borderRadius:
                BorderRadius.all(Radius.circular(10)) ,
                    color: Colors.white),
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width*0.95,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Choose WicketKeeper' , style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),),
                      )),
                      const Divider(height: 3,thickness: 1,
                        color: Color(0xffff3f3f3),),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (BuildContext context , int index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: (){},
                                  title: const Text('BhargavaRam'),
                                ),
                                const Divider(height: 3,thickness: 1,
                                  color: Color(0xFFFf3f3f3),),
                              ],
                            );
                          }, itemCount: 2,),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ):const SizedBox(),

        blower? Scaffold(
          backgroundColor: Colors.black.withOpacity(0.4),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(0),
                child: IconButton(onPressed: () {
                  setState(() {
                    blower = !blower;
                  });
                },
                  icon: const Icon(Icons.close,color: Colors.white,),),
              ),
              Container(
                decoration: const BoxDecoration(borderRadius:
                BorderRadius.all(Radius.circular(10)) ,
                    color: Colors.white),
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width*0.95,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Choose Blowers' , style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),),
                      )),
                      const Divider(height: 3,thickness: 1,
                        color: Color(0xffff3f3f3),),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (BuildContext context , int index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: (){

                                  },
                                  title: const Text('Ashelsh'),
                                ),
                                const Divider(height: 3,thickness: 1,
                                  color: Color(0xFFFf3f3f3),),
                              ],
                            );
                          }, itemCount: 4,),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ):const SizedBox(),

        stopMatch?Scaffold(
          backgroundColor: Colors.black.withOpacity(0.4),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(0),
                child: IconButton(onPressed: () {
                  setState(() {
                    stopMatch = !stopMatch;
                  });
                }, icon: const Icon(Icons.close,color: Colors.white,),),
              ),
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,  color: Colors.white)
                ,
                height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.width*0.95,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Choose Reason' , style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),),
                      )),
                      const Divider(height: 3,thickness: 1,color: Color(0xFFFf3f3f3),),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (BuildContext context , int index) {
                            return Column(
                              children: [
                                ListTile(
                                  onTap: (){},
                                  title:  Text(
                                      raesons[index],
                                  ),
                                ),
                                const Divider(height: 3,thickness: 1,
                                  color: Color(0xFFFf3f3f3),),
                              ],
                            );
                          }, itemCount: raesons.length,),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ):const SizedBox(),
      ],
    );
  }
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: Colors.black,
    );
  }
}

