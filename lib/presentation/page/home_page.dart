import 'dart:typed_data';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_api_app/backbone/constants.dart';
import 'package:google_maps_api_app/backbone/dependency_injection.dart' as di;
import 'package:google_maps_api_app/presentation/bloc/charge_point/bloc.dart';
import 'package:google_maps_api_app/presentation/bloc/charge_point_address/bloc.dart';
import 'package:google_maps_api_app/presentation/bloc/status.dart';
import 'package:google_maps_api_app/presentation/widget/info_window_widget.dart';
import 'package:google_maps_api_app/theme/palette.dart';
import 'package:google_maps_api_app/utils/map_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChargePointBloc chargePointBloc = di.sl.get();
  final ChargePointAddressBloc chargePointAddressBloc = di.sl.get();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  BitmapDescriptor? mapMarker;

  Future<void> setCustomMarker() async {
    final Uint8List markerIcon = await mapUtils.getBytesFromAsset(
        'assets/map/neon_charge_point.png', 110.w.toInt());
    final BitmapDescriptor m = BitmapDescriptor.fromBytes(markerIcon);
    setState(() {
      mapMarker = m;
    });
  }

  MapUtils mapUtils = MapUtils();

  Set<Marker> chargePointsSet = <Marker>{};
  String houseNumber = '';
  String road = '';

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapUtils.getMapStyle());
    _customInfoWindowController.googleMapController = controller;
  }

  @override
  void initState() {
    super.initState();
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    chargePointBloc.add(
      ChargePointEvent.getPlacesByRadius(
        kinds,
        format,
        openTripApiKey!,
        newYorkLat.toString(),
        newYorkLon.toString(),
        displayedRadius.toString(),
      ),
    );
    setCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.darkGray,
      floatingActionButton: const SizedBox(),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: BlocBuilder<ChargePointBloc, ChargePointState>(
                bloc: chargePointBloc,
                builder: (_, ChargePointState state) {
                  if (state.status == BlocStatus.Loading) {
                    return const Scaffold(
                      backgroundColor: Palette.darkGray,
                      body: Center(
                        child: CircularProgressIndicator(
                          color: Palette.darkPurple,
                        ),
                      ),
                    );
                  } else if (state.status == BlocStatus.Loaded) {
                    int i = 0;
                    state.chargePoints.forEach((dynamic element) {
                      final int index = i;
                      final String xid = state.chargePoints[index].id;
                      final String? name = state.chargePoints[index].name;
                      final double lat = state.chargePoints[index].lat;
                      final double lon = state.chargePoints[index].lon;
                      chargePointsSet.add(
                        Marker(
                          onTap: () {
                            chargePointAddressBloc.add(
                              ChargePointAddressEvent.getPlaceById(
                                xid,
                                openTripApiKey!,
                              ),
                            );
                            chargePointAddressBloc.stream
                                .listen((ChargePointAddressState state) {
                              if (state.status == BlocStatus.Loading) {
                                _customInfoWindowController.addInfoWindow!(
                                    const InfoWindowWidget(
                                      title: '...',
                                      houseNumber: '...',
                                      road: '',
                                    ),
                                    LatLng(lat, lon));
                              } else if (state.status == BlocStatus.Loaded) {
                                _customInfoWindowController.addInfoWindow!(
                                    InfoWindowWidget(
                                      title: name,
                                      houseNumber:
                                          state.chargePointAddress.houseNumber,
                                      road: state.chargePointAddress.road,
                                    ),
                                    LatLng(
                                      lat,
                                      lon,
                                    ));
                              } else {
                                Text('${state.error}');
                              }
                            });
                          },
                          markerId: MarkerId('$index'),
                          position: LatLng(
                            state.chargePoints[index].lat,
                            state.chargePoints[index].lon,
                          ),
                          icon: mapMarker!,
                        ),
                      );
                      i++;
                    });
                    return Stack(
                      children: <Widget>[
                        GoogleMap(
                          onTap: (LatLng position) {
                            _customInfoWindowController.hideInfoWindow!();
                          },
                          onCameraMove: (CameraPosition position) {
                            _customInfoWindowController.onCameraMove!();
                          },
                          myLocationEnabled: false,
                          myLocationButtonEnabled: false,
                          initialCameraPosition: newYorkCameraPosition,
                          onMapCreated: _onMapCreated,
                          markers: chargePointsSet,
                        ),
                        CustomInfoWindow(
                          controller: _customInfoWindowController,
                          width: 295.w,
                          height: 75.h,
                          offset: 35.h,
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text('${state.error}'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
