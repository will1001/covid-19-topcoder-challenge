import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

Widget mapMarkerDashboard(BuildContext context) {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers={};
  BitmapDescriptor pinLocationIcon;
  Geolocator geolocator = Geolocator();

  BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
          'assets/052_-_hospital_map_marker_pin_doctor-512.png')
      .then((onValue) {
    pinLocationIcon = onValue;
  });

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

  return Card(
    elevation: 9,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.33,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Position>(
            future: _getLocation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final LatLng _currentPosition =
                    LatLng(snapshot.data.latitude, snapshot.data.longitude);
                final LatLng _hospitalPosition =
                    LatLng(-8.629470099999999, 116.5289445);
                final LatLng _hospitalPosition2 =
                    LatLng(-8.604733, 116.5353003);

                CameraPosition _kGooglePlex = CameraPosition(
                  target: _currentPosition,
                  zoom: 12,
                );

                _markers.add(
                  Marker(
                    markerId: MarkerId("you here"),
                    position: _currentPosition,
                    icon: BitmapDescriptor.defaultMarker,
                  ),
                );
                _markers.add(
                  Marker(
                    markerId: MarkerId("hospital here"),
                    position: _hospitalPosition,
                    icon: pinLocationIcon,
                    infoWindow: InfoWindow(
                      title: "Puskesmas Kerongkong 2.0 km",
                    ),
                  ),
                );
                _markers.add(
                  Marker(
                    markerId: MarkerId("hospital here 2"),
                    position: _hospitalPosition2,
                    icon: pinLocationIcon,
                    infoWindow: InfoWindow(
                      title: "Puskesmas Suralaga 3.0 km",
                    ),
                  ),
                );
                return Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    GoogleMap(
                      markers: _markers,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.fullscreen,
                            size: 45,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/fullScreenMap');
                          }),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    ),
  );
}
