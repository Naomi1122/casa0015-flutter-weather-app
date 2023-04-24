import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ForecastTileProvider implements TileProvider {
  final String _overlayType;

  ForecastTileProvider(this._overlayType);
  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    Uint8List tileBytes = Uint8List(0);
    try {
      final url =
          "http://tile.openweathermap.org/map/$_overlayType/$zoom/$x/$y.png?&appid=API_KEY";
      final uri = Uri.parse(url);
      final imageData = await NetworkAssetBundle(uri).load("");
      tileBytes = imageData.buffer.asUint8List();
      //TilesCache.tiles[url] = tileBytes;
    } catch (e) {
      print(y.toString());
    }
    return Tile(256, 256, tileBytes);
  }
}
