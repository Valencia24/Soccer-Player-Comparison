import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//ignore_for_file: prefer_const_constructors

// this class builds the Ronaldo map screen state
class FunchalMap extends StatefulWidget {
  const FunchalMap({super.key});

  @override
  State<FunchalMap> createState() => _FunchalMapState();
}

// this class passes in the coordinates to the GoogleMap to display the city of
// Funchal, Portugal. a simple appbar is displayed matching the colors of the
// Ronaldo visual and states the city being shown. Two fabs are located in the
// top right and top left to change how the map is displayed and whether or not
// traffic is enabled, respectively.
class _FunchalMapState extends State<FunchalMap> {
  static final LatLng funchal = LatLng(32.652112, -16.907431);

  static final CameraPosition startPos =
  CameraPosition(target: funchal, zoom: 15.0, tilt: 0, bearing: 0);

  bool selected = false;
  MapType _mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funchal, Portugal"),
        backgroundColor: Colors.redAccent,
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