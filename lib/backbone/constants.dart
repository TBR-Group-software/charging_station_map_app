import 'package:flutter_config/flutter_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double newYorkLat = 40.730610;
const double newYorkLon = -73.935242;
const double displayedRadius = 25000;
const String kinds = 'charging_station';
const String format = 'geojson';
const CameraPosition newYorkCameraPosition = CameraPosition(
  target: LatLng(
    newYorkLat,
    newYorkLon,
  ),
  zoom: 11,
);

String? openTripApiKey = '5ae2e3f221c38a28845f05b653fc387a8dba9d23fab8d6eb34551625';
