import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/model_forcastdata.dart';
import '../../utils/constant.dart';
import '../loc_permission.dart';

class GetForcast {
  Future<ForcastWeather> fetchForcastWeather(lat, lon, context) async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiId&units=metric");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("fetch forcastWeather");
      return ForcastWeather.fromJson(body);
    } else {
      // Future<dynamic> aaav() async {
      return throw showNotification(context);
    }
  }
  // return ForcastWeather();
}
// }
