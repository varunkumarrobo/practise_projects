import 'package:flutter/material.dart';
import 'package:protest/custombutton.dart';
import 'package:protest/success_failure_page.dart';

class SuccessTournament extends StatelessWidget {
  const SuccessTournament({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StatusBar(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/trophy.png'),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  '85b68e',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 31,
                    color: Color(0xff4A90E2),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Robosoft Premiere League',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4A4A4A)),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Successfully Created!',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 19,
                      color: Color(0xff4A4A4A)),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: const Color(0xffF5A623),
                        width: 3.0,
                      ),
                    ),
                    height: 60,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 53),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.share,
                            color: Color(0xffF5A623),
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'SHARE',
                            style: TextStyle(
                                color: Color(0xffF5A623),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton4(
        text: 'PROCEED',
        onPressed: () {},
      ),
    );
  }
}
