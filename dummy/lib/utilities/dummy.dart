// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../model/weather_data.dart';
// import '../servieces/weather.dart';
//
// class WeathgerData extends StatefulWidget {
//   const WeathgerData({Key? key}) : super(key: key);
//
//   @override
//   State<WeathgerData> createState() => _WeathgerDataState();
// }
//
// class _WeathgerDataState extends State<WeathgerData> {
//   late int tempratureinC;
//   late double tempratureinF;
//   late int mintemprature;
//   late int maxtemprature;
//   //late int condition;
//   late String weatherImage;
//   late String cityName;
//   late String message;
//   late String description;
//   late int humidity;
//   late int visibility;
//   late String country;
//
//   WeatherModel weather = WeatherModel();
//   @override
//   void initState() {
//     var weatherData =
//         Provider.of<WeatherData>(context, listen: false).weatherData;
//     updateUi(weatherData);
//   }
//
//   void updateUi(dynamic weatherData) {
//     print(weatherData);
//     if (weatherData == null) {
//       tempratureinC = 0;
//       weatherImage = 'error';
//       message = 'Unable to get weather data';
//       cityName = '';
//       return;
//     }
//     double temp = weatherData['main']['temp'];
//     tempratureinC = temp.toInt();
//     tempratureinF = (tempratureinC * 1.80000) + 32;
//     int condition = weatherData['weather'][0]['id'];
//     cityName = weatherData['name'];
//     weatherImage = weather.getWeatherImage(condition);
//     message = weatherData['weather'][0]["description"];
//     double mintemp = weatherData['main']['temp_min'];
//     double maxtemp = weatherData['main']['temp_max'];
//     mintemprature = mintemp.toInt();
//     maxtemprature = maxtemp.toInt();
//     humidity = weatherData['main']['humidity'];
//     visibility = weatherData['visibility'];
//     country = weatherData['sys']['country'];
//   }
//
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
//       height: MediaQuery.of(context).size.height,
//       //color: Colors.blueGrey,
//       child: Stack(
//         children: [
//           Container(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "WED, 28 NOV  2018    11:35  AM",
//                   style: TextStyle(
//                       color: Color.fromRGBO(255, 255, 255, 0.6),
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: 1),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Text(
//                   "${cityName}, ${country}",
//                   style: TextStyle(
//                       color: Color.fromRGBO(255, 255, 255, 1),
//                       fontSize: 25,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.015,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {},
//                       child: Image(
//                         image: AssetImage(
//                           "images/favourite/icon_favourite.png",
//                         ),
//                         width: 40,
//                         height: 40,
//                       ),
//                     ),
//                     Text(
//                       "Add to favourite",
//                       style: TextStyle(
//                           color: Color.fromRGBO(255, 255, 255, 1),
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.08,
//                 ),
//                 Image(
//                   image: AssetImage(
//                     "$weatherImage",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "$tempratureinC",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 50,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {});
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Colors.white,
//                         ),
//                         height: 25,
//                         width: 25,
//                         child: Center(
//                           child: Text(
//                             "°C",
//                             style: TextStyle(color: Colors.redAccent),
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Colors.transparent,
//                         ),
//                         height: 25,
//                         width: 25,
//                         child: Center(
//                           child: Text(
//                             "°F",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 Text(
//                   "$message",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500),
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               margin: EdgeInsets.only(top: 10),
//               //color: Colors.green,
//               // height: 125,
//               height: MediaQuery.of(context).size.height * 0.15,
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   Divider(
//                     thickness: 1,
//                     color: Colors.white38,
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(left: 20),
//                           child: Image.asset(
//                             "images/temperature.png",
//                             fit: BoxFit.fill,
//                           ),
//                           width: 20,
//                           height: 35,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: Column(
//                             children: [
//                               Text("Min - Max",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 18)),
//                               Text("$mintemprature - $maxtemprature",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 25)),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20),
//                           child: Image.asset(
//                             "images/visibility.png",
//                             fit: BoxFit.fill,
//                           ),
//                           width: 30,
//                           height: 25,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: Column(
//                             children: [
//                               Text("Visibility",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 18)),
//                               Text("$visibility",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 25)),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 20),
//                           child: Image.asset(
//                             "images/humidity.png",
//                             fit: BoxFit.fill,
//                           ),
//                           width: 25,
//                           height: 30,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20, right: 20),
//                           child: Column(
//                             children: [
//                               Text("Humidity",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 18)),
//                               Text("47%",
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 25)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
