import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:google_maps_api_app/utils/map_utils_style.dart';

class MapUtils {
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec = await ui
        .instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  String getMapStyle() {
    return mapStyle;
  }
}
