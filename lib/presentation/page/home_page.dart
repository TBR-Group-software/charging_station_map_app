import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_api_app/backbone/constants.dart';
import 'package:google_maps_api_app/backbone/dependency_injection.dart' as di;
import 'package:google_maps_api_app/presentation/bloc/charge_point/bloc.dart';
import 'package:google_maps_api_app/presentation/bloc/status.dart';
import 'package:google_maps_api_app/presentation/page/map_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChargePointBloc chargePointBloc = di.sl.get();
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
    controller.setMapStyle(MapUtils.mapStyle);
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
      floatingActionButton: const SizedBox(),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: BlocBuilder<ChargePointBloc, ChargePointState>(
                bloc: chargePointBloc,
                builder: (_, ChargePointState state) {
                  if (state.status == BlocStatus.Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == BlocStatus.Loaded) {
                    int i = 0;
                    state.chargePoints.forEach((dynamic element) {
                      final int index = i;
                      chargePointsSet.add(
                        Marker(
                          onTap: () {
                            _customInfoWindowController.addInfoWindow!(
                                Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.account_circle,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              Text("I am here",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6)
                                            ],
                                          ),
                                        ),
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                    Triangle.isosceles(
                                      edge: Edge.BOTTOM,
                                      child: Container(
                                        color: Colors.blue,
                                        width: 20.0,
                                        height: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                                LatLng(
                                  state.chargePoints[index].lat,
                                  state.chargePoints[index].lon,
                                ));
                            chargePointBloc.add(
                              ChargePointEvent.getPlaceById(
                                state.chargePoints[index].id,
                                openTripApiKey!,
                              ),
                            );
                          },
                          markerId: MarkerId('$index'),
                          position: LatLng(
                            state.chargePoints[index].lat,
                            state.chargePoints[index].lon,
                          ),
                          // infoWindow: InfoWindow(
                          //   title: state.chargePoints[index].name == '' ||
                          //           state.chargePoints[index].name == null
                          //       ? 'Unknown'
                          //       : state.chargePoints[index].name,
                          //   snippet: (state.chargePointAddress.houseNumber ==
                          //               null
                          //           ? ''
                          //           : state.chargePointAddress.houseNumber!) +
                          //       ' ' +
                          //       (state.chargePointAddress.road == null ||
                          //               state.chargePointAddress.road == ''
                          //           ? 'unknown street'
                          //           : state.chargePointAddress.road!),
                          // ),
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
                          height: 75,
                          width: 150,
                          offset: 50,
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
