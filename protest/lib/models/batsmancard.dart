import 'package:flutter/material.dart';

class MostRunsCard extends StatelessWidget {
  const MostRunsCard({
    required this.batsmanName,
    required this.runs,
    required this.matches,
    required this.strikeRate,
    this.isTitle = false,
    Key? key,
  }) : super(key: key);

  final String batsmanName;
  final String runs;
  final String matches;
  final String strikeRate;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration:  BoxDecoration(
        color: isTitle ? const Color.fromRGBO(216, 216, 216, 1) : Colors.white,),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
            child: Text(
              batsmanName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  alignment: Alignment.center,
                  child: Text(
                    matches,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  alignment: Alignment.center,
                  child: Text(
                    runs,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Text(
                    strikeRate,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(102, 102, 102, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BowlingCard extends StatelessWidget {
  const BowlingCard({
    required this.bowlerName,
    required this.wickets,
    required this.matches,
    required this.average,
    this.isTitle = false,
    Key? key,
  }) : super(key: key);

  final String bowlerName;
  final String wickets;
  final String matches;
  final String average;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration:  BoxDecoration(
        color: isTitle ? const Color.fromRGBO(216, 216, 216, 1) : Colors.white,),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
            child: Text(
              bowlerName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  alignment: Alignment.center,
                  child: Text(
                    matches,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  alignment: Alignment.center,
                  child: Text(
                    wickets,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Text(
                    average,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
