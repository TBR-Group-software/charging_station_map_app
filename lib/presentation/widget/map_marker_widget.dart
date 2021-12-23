import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_api_app/theme/palette.dart';

class MapMarkerWidget extends StatelessWidget {
  final Color _color;

  const MapMarkerWidget({
    required Color color,
    Key? key,
  })  : _color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.charging_station_sharp,
      color: Palette.primaryGreen,
      size: 32.sp,
    );
  }
}
