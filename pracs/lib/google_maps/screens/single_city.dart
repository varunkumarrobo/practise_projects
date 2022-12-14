import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_launcher.dart';


class SingleCity extends StatefulWidget {
  const SingleCity({Key? key, required this.cityData}) : super(key: key);
  final Map cityData;

  @override
  State<SingleCity> createState() => _SingleCityState();
}

class _SingleCityState extends State<SingleCity> {

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      final marker = Marker(
        markerId: MarkerId(widget.cityData['id']),
        position: LatLng(widget.cityData['lat'], widget.cityData['lng']),
        infoWindow: InfoWindow(
            title: widget.cityData['name'],
            snippet: widget.cityData['address'],
            onTap: () {
              print('${widget.cityData['lat']},${widget.cityData['lng']}');
            }),
        onTap: () {
          print('Clicked on marker');
        },
      );
      print('${widget.cityData['lat']},${[widget.cityData['lng']]}');
      _markers[widget.cityData['name']] = marker;
    });
  }

  // launchMap(){
  //   if ( MapLauncher.isMapAvailable(MapType.google)) {
  //     MapLauncher.showMarker(
  //       mapType: MapType.google,
  //       coords: coords,
  //       title: title,
  //       description: description,
  //     );
  //   }
  // }
  // if (await MapLauncher.isMapAvailable(MapType.google)) {
  // await MapLauncher.showMarker(
  // mapType: MapType.google,
  // coords: coords,
  // title: title,
  // description: description,
  // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About ${widget.cityData['name']}'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network(
                  widget.cityData['image'],
                  height: 200,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.cityData['name'],
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        const MapLauncherDemo();
                      },
                      child: const Text('Direction'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.cityData['lat'], widget.cityData['lng']),
                zoom: 8,
              ),
              markers: _markers.values.toSet(),
            ),
          ),
        ],
      ),
    );
  }
}
