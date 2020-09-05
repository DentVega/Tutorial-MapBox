import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapboxMapController;

  void _onMapCreated(MapboxMapController controller) {
    mapboxMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
              zoom: 15, target: LatLng(37.810575, -122.477174))),
    );
  }
}
