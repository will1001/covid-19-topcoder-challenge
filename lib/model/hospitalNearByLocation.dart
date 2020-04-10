import 'package:covid19_app/API/HospitalNearBy.dart';
import 'package:covid19_app/components/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget hospitalNearByLocation(
    CameraPosition initCameraPostion, LatLng currentPosition) {
  final Set<Marker> _markers = {};
  BitmapDescriptor pinLocationIcon;

  BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
          'assets/052_-_hospital_map_marker_pin_doctor-512.png')
      .then((onValue) {
    pinLocationIcon = onValue;
  });

  createMarker(
      String markerID, LatLng currentPos, BitmapDescriptor markerIcon,String name) {
    return Marker(
      markerId: MarkerId(markerID),
      position: currentPos,
      icon: markerIcon,
      infoWindow: InfoWindow(
        title: name,
      ),
    );
  }

  return FutureBuilder<List<HospitalNearBy>>(
      future: fetchHospitalNearBy(currentPosition),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var yourPostion = createMarker(
              "your Position", currentPosition, BitmapDescriptor.defaultMarker,"");

          _markers.add(yourPostion);

          snapshot.data.map((f) {
            _markers
                .add(createMarker(f.id, LatLng(f.lat, f.lng), pinLocationIcon,f.name));
          }).toList();

          return map(_markers, initCameraPostion);
        }
        return CircularProgressIndicator();
      });
}
