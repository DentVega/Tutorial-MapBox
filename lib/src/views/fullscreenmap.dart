import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapboxMapController;
  final center = LatLng(37.810575, -122.477174);
  final dark = 'mapbox://styles/brianvh/ckeqck6oq1cvo19mtjmv6ff9q';
  final streetsStyle = 'mapbox://styles/brianvh/ckeqcmlr81f2m19qs0us09ivv';
  String selectedStyle = 'mapbox://styles/brianvh/ckeqck6oq1cvo19mtjmv6ff9q';

  void _onMapCreated(MapboxMapController controller) {
    mapboxMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createMap(),
      floatingActionButton: floatingButtons(),
    );
  }

  Column floatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //Simbolo
        FloatingActionButton(
          onPressed: () {
            mapboxMapController.addSymbol(SymbolOptions(
                geometry: center,
                // https://github.com/mapbox/mapbox-gl-styles
                iconImage: 'heliport-15',
                iconSize: 3,
                textField: 'Montaña Creada Aqui',
                textOffset: Offset(0, 2)));
          },
          child: Icon(Icons.sentiment_very_dissatisfied),
        ),
        SizedBox(
          height: 5,
        ),
        //Zoom In
        FloatingActionButton(
          onPressed: () {
            mapboxMapController.animateCamera(CameraUpdate.zoomIn());
          },
          child: Icon(Icons.zoom_in),
        ),
        SizedBox(
          height: 5,
        ),
        //Zoom Out
        FloatingActionButton(
          onPressed: () {
            mapboxMapController.animateCamera(CameraUpdate.zoomOut());
          },
          child: Icon(Icons.zoom_out),
        ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (selectedStyle == dark) {
                selectedStyle = streetsStyle;
              } else {
                selectedStyle = dark;
              }
            });
          },
          child: Icon(Icons.add_to_home_screen),
        )
      ],
    );
  }

  MapboxMap createMap() {
    return MapboxMap(
        styleString: selectedStyle,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 14));
  }
}
