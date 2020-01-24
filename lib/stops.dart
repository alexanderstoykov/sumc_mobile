import 'dart:convert';
import 'package:http/http.dart' as http;

class Stops {
//  Future getStops() async {
//    http.Response resp = await http
//        .get('https://routes.sofiatraffic.bg/resources/stops-bg.json');
//    if (resp.statusCode == 200) {
//      return jsonDecode(resp.body);
//    } else {
//      print('errorr!!!!!!!!!!!!!');
//      print('errorr!!!!!!!!!!!!!');
//      print('errorr!!!!!!!!!!!!!');
//      print('errorr!!!!!!!!!!!!!');
//      print('errorr!!!!!!!!!!!!!');
//    }
//  }
}

Future<String> getStops() async {
  http.Response resp = await http
      .get('https://routes.sofiatraffic.bg/resources/stops-bg.json');
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