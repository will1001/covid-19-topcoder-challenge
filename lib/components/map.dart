import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget map(Object markers,CameraPosition initCameraPostion) {
  Completer<GoogleMapController> _controller = Completer();
  return GoogleMap(
    markers: markers,
    mapType: MapType.normal,
    initialCameraPosition: initCameraPostion,
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
  );
}
