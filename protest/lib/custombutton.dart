import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration:  const BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromRGBO(255, 186, 140, 1),
        Color.fromRGBO(230, 90, 90, 1)]),
        borderRadius: BorderRadius.all(Radius.circular(3.0))
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style:
        ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 15.5,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  const CustomButton1(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 280,
      decoration:  const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromRGBO(255, 186, 140, 1),
            Color.fromRGBO(230, 90, 90, 1)]),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style:
        ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 280,
      // margin: const EdgeInsets.only(left: 10,right: 10),
      decoration:  const BoxDecoration(
          // gradient: LinearGradient(colors: [Color.fromRGBO(255, 186, 140, 1),
          //   Color.fromRGBO(230, 90, 90, 1)]),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style:
        ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
          MaterialStateProperty.all<Color>(const Color.fromRGBO(113, 151, 225, 1)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  const CustomButton3(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration:  const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0))
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style:
        ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
          MaterialStateProperty.all<Color>(const Color.fromRGBO(155, 155, 155, 0.8)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 22.5,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class CustomButton4 extends StatelessWidget {
  const CustomButton4(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      // margin: const EdgeInsets.all(20),
      decoration:  const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromRGBO(255, 186, 140, 1),
            Color.fromRGBO(230, 90, 90, 1)]),
          borderRadius: BorderRadius.all(Radius.circular(3.0))
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style:
        ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
          MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}