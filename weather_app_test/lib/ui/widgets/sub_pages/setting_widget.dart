import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_widget.dart';

//import 'color_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(249, 247, 188, 241),
        title: const Text('Map'),
      ),
      body: Center(
        child: MapSample(),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(51.5052, 0.1276),
    zoom: 5,
  );

  Set<TileOverlay> _tileOverlays = {};
  String _overlayType = 'precipitation_new';

  _initTiles() async {
    final String overlayId = DateTime.now().microsecondsSinceEpoch.toString();
    final tileOverlay = TileOverlay(
        tileOverlayId: TileOverlayId(overlayId),
        tileProvider: ForecastTileProvider(_overlayType));
    setState(() {
      _tileOverlays = {tileOverlay};
    });
  }

  void _changeOverlayType(String type) {
    setState(() {
      _overlayType = type;
      _tileOverlays.clear();
    });
    _initTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _initTiles();
              },
              tileOverlays: _tileOverlays,
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _changeOverlayType('precipitation_new'),
                  child: Text('Precip'),
                ),
                ElevatedButton(
                  onPressed: () => _changeOverlayType('wind_new'),
                  child: Text('Wind'),
                ),
                ElevatedButton(
                  onPressed: () => _changeOverlayType("pressure_new"),
                  child: Text("Pressure"),
                ),
                ElevatedButton(
                  onPressed: () => _changeOverlayType("clouds_new"),
                  child: Text("Clouds"),
                ),
                ElevatedButton(
                  onPressed: () => _changeOverlayType("temp_new"),
                  child: Text("Temp"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
