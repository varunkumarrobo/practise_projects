
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart' as locations;
import 'dart:async';
import 'dart:convert';
//import 'package:label_marker/label_marker.dart';
import 'package:http/http.dart' as http;
import 'package:pracs1/providers/search_places_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  //Initial map position on load
  final Completer<GoogleMapController> _controller = Completer();

  //Debounce to throttle async calls during search
  Timer? debounce;

  //Toggling UI as we need;
  bool searchToggle = false;
  bool radiusSlider = false;
  bool pressedNear = false;
  bool cardTapped = false;
  bool getDirections = false;

  //Markers set
   Set<Marker> _markers = {};

  //Text Editing Controllers
  TextEditingController searchController = TextEditingController();

  String googleApikey = 'AIzaSyA2xlwo1Pr4cP5jvHQhmLH8HDjYQySZcdQ';
  // late GoogleMapController mapController;
  // CameraPosition? cameraPosition;

  final LatLng _currentLocation = const LatLng(13.340881, 74.742142);
  // String location = 'Search Location';
  // List<String> hotels = [];
  // List<String> photos = [];
  // late ScrollController controller = ScrollController();
  // bool CardVisible = false;


  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    //Providers
    final allSearchResults = ref.watch(placeResultsProvider);
    final searchFlag = ref.watch(searchToggleProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
            children: [
              SizedBox(
                height: screenheight,
                width:screenwidth,
                child: GoogleMap(
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: _currentLocation,
                    zoom: 11.0,
                  ),
                  markers: _markers,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController googleController) {
                    //method called when map is created
                    setState(() {
                      _controller.complete(googleController);
                    });
                  },
                ),
              ),
              searchToggle ?
               Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5.0),
               child: Column(
                 children: [
                   Container(
                     height: 50.0,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: Colors.white,
                     ),
                     child: TextFormField(
                       controller: searchController,
                       decoration: InputDecoration(
                         contentPadding: const EdgeInsets.symmetric(
                           horizontal: 20.0,vertical: 15.0,
                         ),
                         border: InputBorder.none,
                         hintText: 'Search',
                         suffixIcon: IconButton(
                             onPressed: (){
                           setState(() {
                             searchToggle = false;

                             searchController.text= '';

                           });
                         },
                             icon: const Icon(Icons.close),),
                       ),
                       onChanged: (value){
                         if(debounce?.isActive ?? false)
                           debounce?.cancel();
                         debounce = Timer(
                             const Duration(milliseconds: 700), () async {
                           if(value.length > 2){
                             if(!searchFlag.searchToggle){
                               searchFlag.toggleSearch();
                               _markers = {};
                             }
                             
                           }
                         });
                       },
                     ),
                   )
                 ],
               ),):Container(),

              // Positioned(
              //   top: 10,
              //     child: Padding(
              //       padding: const EdgeInsets.all(15),
              //       child: SafeArea(
              //         child: Card(
              //           child: Container(
              //             padding: const EdgeInsets.all(0),
              //             width: MediaQuery.of(context).size.width - 40,
              //             child: ListTile(
              //               leading: Image.network(
              //                   'https://img.icons8.com/glyph-neue/2x/user-location.png',
              //                   width: 15),
              //               title: TextField(
              //                 decoration: const InputDecoration(
              //                   hintText: 'Search Location',
              //                   border: InputBorder.none),
              //                 onSubmitted: (value){
              //                   // markers.removeWhere((element) =>
              //                   //       element.markerId == "Search Location");
              //                   // getAddress(value);
              //                 },
              //                 ),
              //               trailing: const Icon(Icons.search),
              //               dense: true,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
                ]),
        ],),
      ),
      floatingActionButton: FabCircularMenu(
        alignment: Alignment.bottomLeft,
          fabColor: Colors.blue.shade50,
          fabOpenColor: Colors.red.shade100,
          ringDiameter: 250.0,
          ringWidth: 60.0,
          ringColor: Colors.blue.shade50,
          fabSize: 60.0,
          children: [
            IconButton(
                onPressed: (){
                  setState(() {
                    searchToggle = true;
                    radiusSlider = false;
                    pressedNear = false;
                    cardTapped = false;
                    getDirections = false;
                  });
                },
                icon: const Icon(Icons.search),),
            IconButton(
              onPressed: (){
                setState(() {

                });
              },
              icon: const Icon(Icons.navigation),),
          ]),
          );
  }
}
