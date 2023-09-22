// import 'dart:convert' as convert;

// import 'package:http/http.dart' as http;

// class Locationservices {
//   final String key = 'AIzaSyBm4GCrErBOwkaArd-xhiXgNftCFj7V4HQ';
//   static Future<String> getPlaceID(String input) async {
//     String url =
//         "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=mongolian&inputtype=textquery&key=AIzaSyBPKNqauOsPPJzyTjrksvOD-wrY33930hY";
//     var response = await http.get(Uri.parse(url));
//     var json = convert.jsonDecode(response.body);
//     var placeid = json['candidates'][0]['place_id'] as String;
  //   print(placeid);
  //   return placeid;
  // }
//  Future<Map<String, dynamic>> getPlaces(String input) async {
//     final placeID = getPlaceID(input);
//     final String url =
//         'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&fields=address_components&key=AIzaSyBPKNqauOsPPJzyTjrksvOD-wrY33930hY';
//     var response = await http.get(Uri.parse(url));
//     var json = convert.jsonDecode(response.body);
//     var result = json['result'] as Map<String, dynamic>;
//     return result;
//   }

// }
