import 'package:flutter/material.dart';

class StopScreen extends StatefulWidget {
  static String id = 'stop_screen';

  @override
  _StopScreenState createState() => _StopScreenState();
}

class _StopScreenState extends State<StopScreen> {
  @override
  Widget build(BuildContext context) {
    final Stop stop = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Container(
        color: Colors.teal,
        child: ListView(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          children: <Widget>[
            Box('${stop.id}'),
            Box('${stop.id}'),
            Box('${stop.id}'),
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String text;

  Box(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/tram.png',
            height: 40.0,
          ),
          Text(text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class Stop {
  final int id;

  Stop({this.id});
}
