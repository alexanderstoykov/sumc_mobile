import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'stops.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  static String id = 'map_screen';
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder<List<Marker>>(
          future: loadMarkers(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GoogleMap(
                markers: Set.from(markers),
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(42.661373, 23.379588), zoom: 16.0),
                onCameraMove: (CameraPosition position) {
                  center = position.target;
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraIdle: () {
                  setState(() {});
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          }),
    );
  }
}
