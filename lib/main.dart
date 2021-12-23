import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_api_app/backbone/dependency_injection.dart' as di;
import 'package:google_maps_api_app/presentation/page/home_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const Size screenSize = Size(375, 812);

Future<void> main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
      designSize: screenSize,
    );
  }
}

// import 'package:clippy_flutter/clippy_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:custom_info_window/custom_info_window.dart';

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CustomInfoWindowExample(),
//     );
//   }
// }

// class CustomInfoWindowExample extends StatefulWidget {
//   @override
//   _CustomInfoWindowExampleState createState() =>
//       _CustomInfoWindowExampleState();
// }

// class _CustomInfoWindowExampleState extends State<CustomInfoWindowExample> {
//   CustomInfoWindowController _customInfoWindowController =
//       CustomInfoWindowController();

//   final LatLng _latLng = LatLng(28.7041, 77.1025);
//   final double _zoom = 15.0;

//   @override
//   void dispose() {
//     _customInfoWindowController.dispose();
//     super.dispose();
//   }

//   Set<Marker> _markers = {};

//   @override
//   Widget build(BuildContext context) {
//     _markers.add(
//       Marker(
//         markerId: MarkerId("marker_id"),
//         position: _latLng,
//         onTap: () {
//           _customInfoWindowController.addInfoWindow!(
//             Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.account_circle,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 8.0,
//                           ),
//                           Text(
//                             "I am here",
//                             style:
//                                 Theme.of(context).textTheme.headline6?.copyWith(
//                                       color: Colors.white,
//                                     ),
//                           )
//                         ],
//                       ),
//                     ),
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                 ),
//                 Triangle.isosceles(
//                   edge: Edge.BOTTOM,
//                   child: Container(
//                     color: Colors.blue,
//                     width: 20.0,
//                     height: 10.0,
//                   ),
//                 ),
//               ],
//             ),
//             _latLng,
//           );
//         },
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Info Window Example'),
//         backgroundColor: Colors.red,
//       ),
//       body: Stack(
//         children: <Widget>[
//           GoogleMap(
//             onTap: (LatLng position) {
//               _customInfoWindowController.hideInfoWindow!();
//             },
//             onCameraMove: (CameraPosition position) {
//               _customInfoWindowController.onCameraMove!();
//             },
//             onMapCreated: (GoogleMapController controller) async {
//               _customInfoWindowController.googleMapController = controller;
//             },
//             markers: _markers,
//             initialCameraPosition: CameraPosition(
//               target: _latLng,
//               zoom: _zoom,
//             ),
//           ),
//           CustomInfoWindow(
//             controller: _customInfoWindowController,
//             height: 75,
//             width: 150,
//             offset: 50,
//           ),
//         ],
//       ),
//     );
//   }
// }
