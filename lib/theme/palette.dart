import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Palette {
  static const Color white = Colors.white;

  static const Color ultraLightPurple = ui.Color.fromARGB(255, 255, 110, 248);

  static const Color lightPurple = ui.Color.fromARGB(255, 204, 46, 244);

  static const Color darkPurple = ui.Color.fromARGB(255, 158, 41, 226);

  static const List<Color> purpleGradient = <Color>[
    ui.Color.fromARGB(255, 204, 46, 244),
    ui.Color.fromARGB(255, 158, 41, 226),
  ];
}
