import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'stop_screen.dart';

void main() => runApp(SUMC());

class SUMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: MapScreen.id,
      routes: {
        MapScreen.id: (context) => MapScreen(),
        StopScreen.id: (context) => StopScreen(),
      },
    );
  }
}

//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
//            child: Container(
//              padding: EdgeInsets.all(20.0),
//              child: Center(
//                child: Column(
//                  children: <Widget>[
//                    Row(
//                      crossAxisAlignment: CrossAxisAlignment.end,
//                      textBaseline: TextBaseline.alphabetic,
//                      children: <Widget>[
//                        Icon(
//                          Icons.swap_horizontal_circle,
//                          size: 25.0,
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 8.0),
//                          child: Text(
//                            '329837 7634 6327',
//                            style: TextStyle(
//                              fontSize: 18.0,
//                            ),
//                          ),
//                        ),
//                        Expanded(
//                          child: Container(
//                            alignment: Alignment.centerRight,
//                            child: Icon(
//                              Icons.menu,
//                              size: 25.0,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            '16 Oct, 19',
//                            style: TextStyle(
//                              fontWeight: FontWeight.w300,
//                            ),
//                          ),
//                          Text(
//                            '17 Oct, 19',
//                            style: TextStyle(
//                              fontWeight: FontWeight.w300,
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Text(
//                          'Lviv',
//                          style: TextStyle(
//                            fontSize: 25.0,
//                            color: Colors.green,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        Text(
//                          'Odessa',
//                          style: TextStyle(
//                            fontSize: 25.0,
//                            color: Colors.green,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ),
//              decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.all(Radius.circular(20.0)),
//              ),
//            ),
//          ),
//          Container(
//            child: MapSample(),
//            height: 200.0,
//            width: 200.0,
//            decoration: BoxDecoration(
//              color: Colors.white,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
