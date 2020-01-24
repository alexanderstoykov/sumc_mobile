import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker generate(LatLng pos, int stopId, BitmapDescriptor icon) {
  return Marker(
    icon: icon,
    markerId: MarkerId('stop$stopId'),
    draggable: false,
    onTap: () {
      print('marker $stopId tapped');
    },
    position: pos,
  );
}
