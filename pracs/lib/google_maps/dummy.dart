//myown
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Map Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Map',),
//     );
//   }
// }

// static   final Marker _kGooglePlexMarker = Marker(
//     markerId: const MarkerId('_kGooglePlex'),
//   infoWindow: const InfoWindow(title: 'Google Plex'),
//   icon:  BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//   position: const LatLng(13.379184730298062, 74.74019392524224),
// );

// static const CameraPosition _kLake = CameraPosition(
//   bearing:192.8334901395799,
//     target: LatLng(13.340881,74.742142),
//     tilt:59.440717697143555,
//     zoom: 19.151926040649414);

// static  final Marker _kLakeMarker = Marker(
//   markerId: const MarkerId('_kLakeMarker'),
//   infoWindow: const InfoWindow(title: 'Google Plex'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//   position: const LatLng(13.340881, 74.742142),
// );

// final Set<Marker> _markers ={};
//
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   _markers.addLabelMarker(LabelMarker(
//     backgroundColor: Colors.redAccent,
//     textStyle: const TextStyle(color: Colors.black,fontSize: 40,),
//     markerId: const MarkerId('_kGooglePlex'),
//     icon: BitmapDescriptor.defaultMarker,
//     position: const LatLng(13.379184730298062, 74.74019392524224),
//     infoWindow: const InfoWindow(title: "RoboSoft technologies"), label: '1',
//   ));
// }

// Row(
//   children: [
//     Expanded(child: TextFormField(
//       controller:  _searchController,
//       textCapitalization: TextCapitalization.words,
//       decoration: const InputDecoration(
//         hintText: 'Search by City',
//       ),
//       onChanged: (value){
//         print(value);
//       },
//     ),),
//     IconButton(onPressed: () async {
//       var place =
//       await LocationService().getPlace(_searchController.text);
//       _goToPlace(place);
//     },
//       icon: const Icon(Icons.search),),
//   ],
// ),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// floatingActionButton: FloatingActionButton.extended(
//     onPressed: _goToTheLake,
//     icon: const Icon(Icons.directions_boat),
// label: const Text('To Udupi Krishana mata!'),), // This trailing comma makes auto-formatting nicer for build methods
// Future<void> _goToTheLake() async {
//   GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
// }