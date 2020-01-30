import 'package:flutter/material.dart';

class StopScreen extends StatefulWidget {
  static String id = 'stop_screen';

  @override
  _StopScreenState createState() => _StopScreenState();
}

class _StopScreenState extends State<StopScreen> {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);
    return Container(
      child: Text('aa'),
    );
  }
}
