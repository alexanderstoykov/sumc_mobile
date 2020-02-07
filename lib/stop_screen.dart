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
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          children: <Widget>[
            Row('${stop.id}'),
            Row('${stop.id}'),
            Row('${stop.id}'),
          ],
        ),
      ),
    );
  }
}

class Row extends StatelessWidget {
  final String text;

  Row(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center),
    );
  }
}

class Stop {
  final int id;

  Stop({this.id});
}
