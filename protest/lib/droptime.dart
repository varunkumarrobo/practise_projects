import 'package:flutter/material.dart';

class ManageDurationScreen extends StatefulWidget {
  const ManageDurationScreen({super.key});

  @override
  State<ManageDurationScreen> createState() => _ManageDurationScreenState();
}

class _ManageDurationScreenState extends State<ManageDurationScreen> {

  var _hour = 0;
  var _minute = 0;

  String hour = '';
  String minute = '';

  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duration'),
      ),
      body: Center(
        child: Container(
          height: 170,
          width: 150,
          // color: Colors.cyanAccent,
          margin: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                children: [
                  const Text('Hours'),
                  const SizedBox(height: 6,),
                  GestureDetector(
                    onTap: () {
                      int currentValue = int.parse(hoursController.text);
                      if(currentValue != 11){
                        setState(() {
                          currentValue++;
                          hoursController.text = (currentValue).toString();
                        });
                      }
                      // if(_hour == 11){
                      //   setState(() {
                      //     _hour = -1;
                      //   });
                      // }
                      // if(_hour != 11){
                      //   setState(() {
                      //     _hour += 1;
                      //   });
                      // }
                    },
                    child: const Icon(
                        Icons.arrow_drop_up_outlined,
                    color: Colors.grey,
                    size: 40,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey
                      ),
                        borderRadius: BorderRadius.circular(7),),
                    child: Center(
                      child:
                      TextField(
                        textAlign: TextAlign.center,
                        controller: hoursController,
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey,),),
                        ),
                        // onChanged: (text) {
                        //   setState(() {
                        //     hour = _hour.toString();
                        //   });
                        // },
                      ),
                      //   Text(
                      //      _hour.toString(),
                      //   style: const TextStyle(
                      //     fontSize: 25
                      //   ),
                      // ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      int currentValue = int.parse(hoursController.text);
                      if(currentValue != 11){
                        setState(() {
                          currentValue--;
                          hoursController.text = (currentValue).toString();
                        });
                      }
                      // if(_hour == 00){
                      //   setState(() {
                      //     _hour = 12;
                      //   });
                      // }
                      // if(_hour != 0){
                      //   setState(() {
                      //     _hour -= 1;
                      //   });
                      // }
                    },
                    child: const Icon(
                        Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                      size: 40,),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(':',style: TextStyle(
                  fontSize: 35,
                ),),
              ),
              Column(
                children: [
                  const Text('Minutes'),
                  const SizedBox(height: 6,),
                  GestureDetector(
                    onTap: () {
                      if(_minute == 59){
                        setState(() {
                          _minute = -1;
                        });
                      }
                      if(_minute != 59) {
                        setState(() {
                          _minute += 1;
                        });
                      }
                    },
                    child: const Icon(
                        Icons.arrow_drop_up_outlined,
                      color: Colors.grey,
                      size: 40,),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(border: Border.all(
                      color: Colors.grey,
                    ),
                        borderRadius: BorderRadius.circular(7),),
                    child: Center(
                        child: Text(_minute.toString(),
                          style: const TextStyle(
                              fontSize: 25
                          ),),),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(_minute == 00){
                        setState(() {
                          _minute = 60;
                        });
                      }
                      if(_minute != 00){
                        setState(() {
                          _minute -= 1;
                        });
                      }
                    },
                    child: const Icon(
                        Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                      size: 40,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

