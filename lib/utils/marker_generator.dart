import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MarkerGenerator {
  final Function(List<Uint8List>) callback;
  final List<Widget> markerWidgets;

  MarkerGenerator(this.markerWidgets, this.callback);

  void generate(BuildContext context) {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _afterFirstLayout(context));
  }

  void _afterFirstLayout(BuildContext context) {
    _addOverlay(context);
  }

  void _addOverlay(BuildContext context) {
    final OverlayState overlayState = Overlay.of(context)!;

    final OverlayEntry entry = OverlayEntry(
        builder: (BuildContext context) {
          return _MarkerHelper(
            markerWidgets: markerWidgets,
            callback: callback,
          );
        },
        maintainState: true);

    overlayState.insert(entry);
  }
}

class _MarkerHelper extends StatefulWidget {
  final List<Widget> markerWidgets;
  final Function(List<Uint8List>) callback;

  const _MarkerHelper({
    required this.markerWidgets,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  _MarkerHelperState createState() => _MarkerHelperState();
}

class _MarkerHelperState extends State<_MarkerHelper>
    with AfterLayoutMixin<_MarkerHelper> {
  List<GlobalKey> globalKeys = <GlobalKey>[];

  @override
  void afterFirstLayout(BuildContext context) {
    _getBitmaps(context).then((List<Uint8List> list) {
      widget.callback(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(MediaQuery.of(context).size.width, 0),
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: widget.markerWidgets.map((Widget w) {
            final GlobalKey<State<StatefulWidget>> markerKey = GlobalKey();
            globalKeys.add(markerKey);
            return RepaintBoundary(
              key: markerKey,
              child: w,
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<List<Uint8List>> _getBitmaps(BuildContext context) async {
    final Iterable<Future<Uint8List>> futures = globalKeys.map(
        (GlobalKey<State<StatefulWidget>> key) => _getUint8List(key, context));
    return Future.wait(futures);
  }

  Future<Uint8List> _getUint8List(
      GlobalKey markerKey, BuildContext context) async {
    final RenderRepaintBoundary boundary = (markerKey.currentContext!
        .findRenderObject())! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(
        pixelRatio: MediaQuery.of(context).devicePixelRatio);
    final ByteData byteData =
        (await image.toByteData(format: ui.ImageByteFormat.png))!;
    return byteData.buffer.asUint8List();
  }
}

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  void afterFirstLayout(BuildContext context);
}
