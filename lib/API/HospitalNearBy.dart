import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future<List<HospitalNearBy>> fetchHospitalNearBy(LatLng currentPosition) async {
  final response =
      await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${currentPosition.latitude},${currentPosition.longitude}&rankby=distance&type=hospital&key=AIzaSyB-6R694SZnX_fh2PxQ9BWnFZPgycs6nyQ');

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body)["results"];
    return (responseJson as List).map((p) => HospitalNearBy.fromJson(p)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class HospitalNearBy {
  final String id;
  final String name;
  final Object lat;
  final Object lng;


  HospitalNearBy({
    this.id,
    this.name,
    this.lat,
    this.lng,
  
  });

  factory HospitalNearBy.fromJson(Map<String, dynamic> json) {
    return HospitalNearBy(
      id: json['id'],
      name: json['name'],
      lat: json['geometry']['location']['lat'],
      lng: json['geometry']['location']['lng'],
  
    );
  }
}
