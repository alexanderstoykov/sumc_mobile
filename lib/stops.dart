import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'marker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

BitmapDescriptor icon;
String stops;
LatLng center;
List<Marker> markers = [];

Future<List<Marker>> loadMarkers() async {
  icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)), 'assets/bus.png');
  center = await loadUserLocation();
  print(center);
  stops = await fetchStops();
  var decoded = jsonDecode(stops);
  for (var i in decoded) {
    markers.add(generate(LatLng(i['y'], i['x']), int.parse(i['c']), icon));
  }

  return markers;
}

Future<String> fetchStops() async {
  http.Response resp =
      await http.get('https://routes.sofiatraffic.bg/resources/stops-bg.json');
  if (resp.statusCode == 200) {
    return resp.body;
  } else {
    print('errorr!!!!!!!!!!!!!');
    print('errorr!!!!!!!!!!!!!');
    print('errorr!!!!!!!!!!!!!');
    print('errorr!!!!!!!!!!!!!');
    print('errorr!!!!!!!!!!!!!');
  }
}

Future<LatLng> loadUserLocation() async {
  Position position = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.lowest,
      locationPermissionLevel: GeolocationPermission.locationWhenInUse);
  return LatLng(position.latitude, position.longitude);
}
