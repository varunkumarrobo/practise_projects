import 'package:geolocator/geolocator.dart';

const apiKey = '9d3fd511637028c667538aec847749eb';

class GetLocation {
  late double lattitude;
  late double longitude;
  Future<void> getCurrentLocationData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (LocationPermission != true) {
      LocationPermission permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lattitude = position.latitude;
    longitude = position.longitude;
    // print(position);
  }
}
