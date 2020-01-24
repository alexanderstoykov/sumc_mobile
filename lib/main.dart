import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'marker.dart';
import 'stops.dart';
import 'dart:convert';

void main() => runApp(SUMC());

class SUMC extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: SafeArea(
          child: MapSample(),
        ),
        backgroundColor: Colors.green[800],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Icon(
                          Icons.swap_horizontal_circle,
                          size: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '329837 7634 6327',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.menu,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '16 Oct, 19',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '17 Oct, 19',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Lviv',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Odessa',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Container(
            child: MapSample(),
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor icon;

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    test();
  }

  void setCustomMapPin() async {
    icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/bus.png');
  }

  String stops;

  void test() async {
    stops = await getStops();
  }

  @override
  Widget build(BuildContext context) {
    print(jsonDecode(stops));
    List<Marker> allMarkers = [
      generate(LatLng(42.661574, 23.378494), 1, icon),
      generate(LatLng(42.659069, 23.382173), 2, icon),
    ];

    return new Scaffold(
      body: GoogleMap(
        markers: Set.from(allMarkers),
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(42.661373, 23.379588), zoom: 16.0),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
