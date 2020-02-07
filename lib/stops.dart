import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' show cos, sqrt, asin;
import 'stop_screen.dart';

BitmapDescriptor icon;
dynamic stops;
LatLng center;
List<Marker> markers = [];

Future<List<Marker>> loadMarkers(BuildContext context) async {
  var futures = List<Future>();
  futures.add(setMapCenter());
  futures.add(loadStops());
  futures.add(loadIcon());
  await Future.wait(futures);

  for (var stop in stops) {
    var stopPosition = LatLng(stop['y'], stop['x']);
    double offset = await Geolocator().distanceBetween(center.latitude,
        center.longitude, stopPosition.latitude, stopPosition.longitude);
    if (offset < 1000) {
      //less than 1000m away
      markers.add(Marker(
        icon: icon,
        markerId: MarkerId('stop${int.parse(stop['c'])}'),
        draggable: false,
        onTap: () {
          Navigator.pushNamed(context, StopScreen.id,
              arguments: Stop(id: int.parse(stop['c'])));
        },
        position: stopPosition,
      ));
    }
  }

  return markers;
}

Future<String> loadStops() async {
  if (stops == null) {
    http.Response resp = await http
        .get('https://routes.sofiatraffic.bg/resources/stops-bg.json');
    if (resp.statusCode == 200) {
      stops = jsonDecode(resp.body);
    } else {
      print('errorr!!!!!!!!!!!!!');
    }
  }
}

Future<void> setMapCenter() async {
  if (center == null) {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        locationPermissionLevel: GeolocationPermission.locationWhenInUse);
    center = LatLng(
        42.661265, 23.379814); //LatLng(position.latitude, position.longitude);
  }
}

Future<void> loadIcon() async {
  if (icon == null) {
    icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/bus.png');
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
