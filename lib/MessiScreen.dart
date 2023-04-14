import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//ignore_for_file: prefer_const_constructors

// this class builds the Messi map screen state
class RosarioMap extends StatefulWidget {
  const RosarioMap({super.key});

  @override
  State<RosarioMap> createState() => _RosarioMapState();
}

// this class passes in the coordinates to the GoogleMap to display the city of
// Rosario, Argentina. a simple appbar is displayed matching the colors of the
// Messi visual and states the city being shown. Two fabs are located in the
// top right and top left to change how the map is displayed and whether or not
// traffic is enabled, respectively.
class _RosarioMapState extends State<RosarioMap> {
  static final LatLng rosario = LatLng(-32.953735, -60.693783);

  static final CameraPosition startPos =
  CameraPosition(target: rosario, zoom: 15.0, tilt: 0, bearing: 0);

  bool selected = false;
  MapType _mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rosario, Argentina"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: startPos,
            mapType: _mapType,
            trafficEnabled: selected,
          ),
          Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  selected = (selected == true) ? false : true;
                });
              },
              heroTag: "non-null",
              child: Icon(Icons.directions_car),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _mapType = (_mapType == MapType.normal)
                      ? MapType.hybrid : MapType.normal;
                });
              },
              child: Icon(Icons.map),
            ),
          ),
        ],
      ),
    );
  }
}