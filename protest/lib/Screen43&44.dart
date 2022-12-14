import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MaterialApp(home: const Screen43()));
}

class Screen43 extends StatefulWidget {
  const Screen43({Key? key}) : super(key: key);

  @override
  State<Screen43> createState() => _Screen43State();
}

class _Screen43State extends State<Screen43> {
  bool success = true; //this one for condition checking, in front page elevated button
  bool stackPage = false; // this one for window popup condition

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      success =! success;
                    });
                  },
                  child: const Text('condition checking'),
                ),
              )
            ],
          ),
        ),
        success
            ? Scaffold(
                backgroundColor: Colors.black.withOpacity(0.4),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            success = !success;
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
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 180,
                                width: 250,
                                child: stackPage? Image.network(
                                  'https://t3.ftcdn.net/jpg/03/62/86/64/240_F_362866440_BrsPA0VVmNcjTiZsgINUXro2ILguUtXW.jpg',
                                  fit: BoxFit.contain,
                                ): Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/6582/6582456.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                             const SizedBox(height: 10,),
                             Center(
                              child: Text(
                                stackPage?
                                'Your Fixture has been ':'Oops! Something',
                                style: const TextStyle(
                                  color: Color(0xff4A4A4A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                             Center(
                              child: Text(
                               stackPage? 'generated!':'went wrong',
                                style: const TextStyle(
                                  color: Color(0xff4A4A4A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 20,
                                  top: 20,
                                  right: 50,
                                  left: 50),
                              child: Center(
                                child:
                                stackPage ? InkWell(
                                  onTap: () {

                                  },
                                  child:  const Center(
                                    child:  Text(
                                      'VIEW MATCHES',
                                      style: TextStyle(
                                        color: Color(0xff4A90E2),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ):InkWell(
                                  onTap: () {

                                  },
                                  child: const Center(
                                    child: Text(
                                      'TRY AGAIN',
                                      style: TextStyle(
                                        color: Color(0xffF5112D),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
