import 'package:flutter/material.dart';
import 'package:protest/custombutton.dart';

class Success_failure_page extends StatelessWidget {
   Success_failure_page({
    Key? key,
  }) : super(key: key);

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: selected ? Container(
        margin: const EdgeInsets.only(bottom: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const StatusBar(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back,
                color: Colors.blue,
                size: 30,),),
              ],
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/cryingball.jpeg',
              fit: BoxFit.none,),
            ),
            // const SizedBox(height: 40,),
            Center(
              child: Column(
                children: const [
                  Text('Oops!!',
                    style: TextStyle(color: Color.fromRGBO(74, 74, 74, 1),
                      fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 0.5,),
                  ),
                  SizedBox(height: 5,),
                  Text('Something went wrong.',
                    style: TextStyle(fontSize: 16,letterSpacing: 0.5,
                        color: Color.fromRGBO(74, 74, 74, 1)),),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 38.0,right: 38.0),
              child: Text('Kindly check if all the details entered by you are proper. If problem persists then check back after sometime.',
              style: TextStyle(
                color: Color.fromRGBO(155, 155, 155, 1),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,),
            ),
          ],
        ),
      )
      :Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const StatusBar(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              },
                child: const Icon(Icons.arrow_back,
                  color: Colors.blue,
                  size: 30,),),
            ],
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset('assets/images/laughingball.png',
              fit: BoxFit.none,),
          ),
          const SizedBox(height: 40,),
          Center(
            child: Column(
              children: const [
                Text('Awesome!!',
                  style: TextStyle(color: Color.fromRGBO(74, 74, 74, 1),
                    fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 0.5,),
                ),
                SizedBox(height: 5,),
                Text('You have Successfully Registered.',
                  style: TextStyle(fontSize: 16,letterSpacing: 0.5,
                      color: Color.fromRGBO(74, 74, 74, 1)),),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 38.0,right: 38.0),
            child: Text('Kindly open the verification email we sent to your registered email ID and verify your account.',
              style: TextStyle(
                color: Color.fromRGBO(155, 155, 155, 1),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 80,),
          CustomButton4(text: 'CREATE TOURNAMENT', onPressed: (){})
        ],
      ),
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

// const SizedBox(height: 80,),
// CustomButton4(text: 'CREATE TOURNAMENT', onPressed: (){
//   selected = false;
// },),
