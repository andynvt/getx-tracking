import 'package:google_maps_flutter/google_maps_flutter.dart';

class Const {
  Const._();

  static final defaultPosition = LatLng(10.771972168931322, 106.70477930257243);
  static final defaultZoom = 15.0;
  static final dataMap = {
    'latitude': defaultPosition.latitude,
    'longitude': defaultPosition.longitude,
    'accuracy': 100.0,
    'altitude': 4.8,
    'speed': 0.0,
    'speed_accuracy': 0.0,
    'heading': 30.0,
    'time': 1625579100542.0,
  };
}
