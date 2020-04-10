import 'package:covid19_app/model/hospitalNearByLocation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

Widget currentLocation() {
  Geolocator geolocator = Geolocator();

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }


  return FutureBuilder<Position>(
      future: _getLocation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          final LatLng _currentPosition =
              LatLng(snapshot.data.latitude, snapshot.data.longitude);
         

          CameraPosition initCameraPostion = CameraPosition(
            target: _currentPosition,
            zoom: 13,
          );

          return hospitalNearByLocation(initCameraPostion,_currentPosition);
        }
        return CircularProgressIndicator();
      });
}
