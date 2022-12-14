import 'package:flutter/material.dart';
import '../services/weather.dart';
import '../screens/city_screen.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationweather;
  LocationScreen({this.locationweather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temprature;
  //late int condition;
  late String weatherIcon;
  late String cityName;
  late String description;
  late String message;
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    updateUi(widget.locationweather);
  }

  void updateUi(dynamic weatherData) {
    if (weatherData == null) {
      temprature = 0;
      weatherIcon = 'error';
      description = 'unable to get weather data';
      message = 'Unable to get weather data';
      cityName = '';
      return;
    }
    double temp = weatherData['main']['temp'];
    temprature = temp.toInt();
    int condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    description = weatherData['description'];
    weatherIcon = weather.getWeatherIcon(condition);
    message = weather.getMessage(temprature);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: const AssetImage('images/location_background.jpg'),
          //   fit: BoxFit.cover,
          //   colorFilter: ColorFilter.mode(
          //       Colors.white.withOpacity(0.8), BlendMode.dstATop),
          // ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUi(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
