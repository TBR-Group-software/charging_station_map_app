import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_api_app/theme/palette.dart';
import 'package:google_maps_api_app/theme/text_styles.dart';

class InfoWindowWidget extends StatelessWidget {
  final String? title;
  final String? houseNumber;
  final String? road;

  const InfoWindowWidget({
    required this.title,
    required this.houseNumber,
    required this.road,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: Palette.purpleGradient,
                ),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 15.h),
                    color: Palette.darkPurple,
                    blurRadius: 40.r,
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    top: 8.h,
                    bottom: 8.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title == '' || title == null ? 'Unknown' : title!,
                        style: TextStyles().mainTextStyle,
                      ),
                      Text(
                        (houseNumber == null ? '??' : houseNumber!) +
                            ' ' +
                            (road == null || road == ''
                                ? 'unknown street'
                                : road!),
                        style: TextStyles().secondaryTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.w),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_right,
                    color: Palette.ultraLightPurple,
                    size: 32.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        Triangle.isosceles(
          edge: Edge.BOTTOM,
          child: Container(
            width: 20.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: Palette.darkPurple,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 15.h),
                  color: Palette.darkPurple,
                  blurRadius: 40.r,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
