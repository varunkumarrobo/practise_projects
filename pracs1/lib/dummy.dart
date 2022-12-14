//import 'dart:ffi';
//import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
//import 'package:geocoding/geocoding.dart';
//import 'package:google_api_headers/google_api_headers.dart';
//import 'package:google_maps_webservice/places.dart';

// void _onMapCreated(GoogleMapController controller){
//   mapController = controller;
// }

// var response = await http.get(Uri.parse(
//     "https://api.tomtom.com/search/2/search/$lat,$lon.json?key=jAGfAq8GG8nuefp7ZWXEEv3ByVRPGqDB&limit=15&radius=2000&categorySet=7315"));
// appBar: AppBar(
//   title: const Text('Maps Sample App'),
//   backgroundColor: Colors.green[700],
// ),

// onCameraMove:  (CameraPosition cameraPosition){
// cameraPosition = cameraPosition;
// },
// onCameraIdle:  () async{
// List<Placemark> placemarks = await placemarkFromCoordinates(
//     cameraPosition!.target.latitude, cameraPosition!.target.longitude);
// setState(() {
//   location = "${placemarks.first.administrativeArea}, ${placemarks.first.street}";
// });
// },
//addMarker('test', _currentLocation);
//markers: _markers.values.toSet(),
// Center(
//   child: Image.network('https://img.icons8.com/glyph-neue/2x/user-location.png',
//     width: 25,),
// ),
// child: InkWell(
//   onTap: () async {
//     var place = await PlacesAutocomplete.show(
//         context: context,
//         apiKey: googleApikey,
//         mode: Mode.overlay,
//         types: [],
//         strictbounds: false,
//         components: [Component(Component.country, 'VP')],
//         onError: (err) {
//           print(err);
//         });
//     if (place != null) {
//       setState(() {
//         location = place.description.toString();
//       });
//
//       final plist = GoogleMapsPlaces(
//         apiKey: googleApikey,
//         apiHeaders: await const GoogleApiHeaders().getHeaders(),
//       );
//       String placeid = place.placeId ?? "0";
//       final detail = await plist.getDetailsByPlaceId(placeid);
//       final geometry = detail.result.geometry!;
//       final lat = geometry.location.lat;
//       final lang = geometry.location.lng;
//       var newlatlang = LatLng(lat, lang);
//
//       mapController.animateCamera(CameraUpdate.newCameraPosition(
//           CameraPosition(target: newlatlang, zoom: 17)));
//     }
//   },
// addMarker(String markerId, LatLng location){
//   var marker = Marker(
//       markerId: MarkerId(markerId),
//   position: location,
//   infoWindow: const InfoWindow(
//     title: 'Title of place',
//     snippet: 'Some description of the place',
//   ));

// markers[markerId] = marker;
// setState(() { });
//}

// currentLocation() async {
//   locations.Location location = locations.Location();
//   bool serviceEnabled = await location.serviceEnabled();
//   if (!serviceEnabled) {
//     serviceEnabled = await location.requestService();
//     if (!serviceEnabled) {
//       return;
//     }
//   }
//
//   locations.PermissionStatus permissionGranted =
//       await location.hasPermission();
//   if (permissionGranted == locations.PermissionStatus.denied) {
//     permissionGranted = await location.requestPermission();
//     if (permissionGranted != locations.PermissionStatus.granted) {
//       return;
//     }
//   }
//
//   locations.LocationData locationData = await location.getLocation();
//   final GoogleMapController cameraController = await _controller.future;
//   cameraController.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(
//           target: LatLng(locationData.latitude!, locationData.longitude!),
//           zoom: 17)));
// }

// Visibility(
//   visible: CardVisible,
//   child: Positioned(
//     bottom: 8,
//     left: 15,
//     right: 15,
//     child: SizedBox(
//       height: 150,
//       child: ListView.builder(
//           controller: controller,
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: hotels.length,
//           itemBuilder: (BuildContext context, int index) {
//             return SizedBox(
//               width: 350,
//               child: Card(
//                 child: Row(
//                   children: [
//                     Image.network(photos[index]),
//                     Expanded(
//                       child: Text(
//                         hotels[index],
//                         style: const TextStyle(fontSize: 25),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     ),
//   ),
// ),


// @override
// void initState() {
//   markers.add(Marker(
//     //add marker on google map
//     markerId:  const MarkerId("current"),
//     position: const LatLng(13.379184730298062, 74.74019392524224),
//     //position of marker
//     infoWindow: const InfoWindow(
//       //popup info
//       title: 'My Custom Title ',
//       snippet: 'My Custom Subtitle',
//     ),
//     onTap: () {
//       getRestaurants(13.379184730298062, 74.74019392524224);
//       setState(() {});
//     },
//     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//   ));
//   //you can add more markers here
//   super.initState();
// }


// @override
// void dispose() {
//   // TODO: implement dispose
//   controller.dispose();
//   super.dispose();
// }

//going to another cities
// getAddress(String address) async {
//   var response = await http.get(Uri.parse(
//       "https://nominatim.openstreetmap.org/?addressdetails=1&q=$address"
//           "&format=json&limit=1"));
//   if (jsonDecode(response.body).length == 0) {
//     Fluttertoast.showToast(
//         msg: "Location not found",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.TOP,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   } else {
//     String lat = jsonDecode(response.body)[0]["lat"];
//     String lon = jsonDecode(response.body)[0]["lon"];
//     final GoogleMapController cameraController = await _controller.future;
//     cameraController.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//             target: LatLng(double.parse(lat), double.parse(lon)), zoom: 17)));
//     setState(() {
//       markers.add(Marker(
//           markerId: const MarkerId("searchLocation"),
//           infoWindow:
//               InfoWindow(title: jsonDecode(response.body)[0]["display_name"]),
//           position: LatLng(double.parse(lat), double.parse(lon))));
//     });
//   }
// }

//nearby Restaurants
// getRestaurants(double lat, double lon) async {
//   var response = await http.get(
//       Uri.parse(
//           "https://api.foursquare.com/v3/places/search?ll=$lat%2C$lon&radius"
//               "=2000&categories=13000"),
//       headers: {
//         'Authorization': 'fsq3T7SKdVMGwe+IQk+L/A1uyXQgk+w0ILNgWBUGmoeyld8=',
//         'accept': 'application/json'
//       });
//   for (var item in jsonDecode(response.body)["results"]) {
//     double lat = item["geocodes"]["main"]["latitude"];
//     double lon = item["geocodes"]["main"]["longitude"];
//     hotels.add(item["categories"][0]["name"]);
//     var responsePhoto = await http.get(
//         Uri.parse(
//             "https://api.foursquare.com/v3/places/${item["fsq_id"]}"
//                 "/photos?limit=1"),
//         headers: {
//           'Authorization': 'fsq3T7SKdVMGwe+IQk+L/A1uyXQgk+w0ILNgWBUGmoeyld8=',
//           'accept': 'application/json'
//         });
//     print(jsonDecode(response.body).length);
//     print(jsonDecode(response.body));
//     if (jsonDecode(responsePhoto.body).length == 0) {
//       print("object");
//       photos.add(
//           "https://img.freepik.com/free-photo/chicken-wings-barbecue-sweetly-"
//               "sour-sauce-picnic-summer-menu-tasty-food-top-view-flat-lay_"
//               "2829-6471.jpg?w=2000");
//     } else
//       photos.add(
//           "${jsonDecode(responsePhoto.body)[0]["prefix"]}original${jsonDecode
//             (responsePhoto.body)[0]["suffix"]}");
//     markers.addLabelMarker(LabelMarker(
//       label: item["categories"][0]["name"],
//       markerId: MarkerId(item["categories"][0]["id"].toString()),
//       position: LatLng(lat, lon),
//       backgroundColor: Colors.redAccent,
//       textStyle: const TextStyle(fontSize: 40),
//       onTap: () {
//         CardVisible = true;
//         controller.animateTo(
//             hotels.indexOf(item["categories"][0]["name"]) * 350.0,
//             duration: const Duration(seconds: 1),
//             curve: Curves.linear);
//         //controller.jumpTo(scroll);
//         setState(() {});
//       },
//     ));
//   }
// }
