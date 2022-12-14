import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MyHomePage(title: 'AA',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _searchController = TextEditingController();

  final TextEditingController _destinationController = TextEditingController();

  final Set<Marker> _markers = <Marker>{};
  final Set<Polygon> _polygons = <Polygon>{};
  final Set<Polyline> _polylines = <Polyline>{};
  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;
  int _polylineIdCounter = 1;


  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(13.379184730298062, 74.74019392524224),
  zoom: 30);

  @override
  void initState() {
    super.initState();

    _setMarker(const LatLng(13.379184730298062, 74.74019392524224));
  }

  void _setMarker(LatLng point){
    setState(() {
      _markers.add(
        Marker(markerId: const MarkerId('marker'),
            position: point),
      );
    });
  }
  void _setPolygon(){
    final String polygonIdval = 'polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId(polygonIdval),
        points: polygonLatLngs,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    );
  }
  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.blue,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
        )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
               child: Column(
                children: [
                        TextFormField(
                        controller:  _searchController,
                        //textCapitalization: TextCapitalization.words,
                           decoration: const InputDecoration(
                              hintText: 'Search by City',
                         ),
                          onChanged: (value){
                          print(value);
                          },
                        ),
                  TextFormField(
                    controller:  _destinationController,
                    //textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      hintText: 'Destination by City',
                    ),
                    onChanged: (value){
                      print(value);
                    },
                  ),
                ],
              ),
            ),
              IconButton(
                onPressed: () async {
                var directions = await LocationService().getDirections(
                _searchController.text,
                    _destinationController.text);
                _goToPlace(
                  directions['start_location']['lat'],
                  directions['start_location']['lng'],
                  directions['bounds_ne'],
                  directions['bounds_sw'],
                  );
                _setPolyline(directions['polyline_decoded']);
              },
                icon: const Icon(Icons.search),),
          ],
          ),
      Expanded(
        child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          // zoomGesturesEnabled: false,
          markers: _markers,
          polygons: _polygons,
          polylines: _polylines,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
          onTap: (point){
            setState(() {
              polygonLatLngs.add(point);
              _setPolygon();
            });
          },
        ),
      ),
    ],
      ),
    );
  }
  Future<void> _goToPlace(
      // Map<String,dynamic> place,
      double lat,
      double lng,
      Map<String, dynamic> boundsNe,
      Map<String, dynamic> boundsSw,) async {
    // final double lat = place['geometry']['location']['lat'];
    // final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng),
      zoom: 15),
    ),
    );
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
          ),
          25),
    );
    _setMarker(LatLng(lat, lng));
  }
}



