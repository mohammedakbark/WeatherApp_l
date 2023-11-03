import 'dart:convert';
import 'package:weather_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import '../../../../model/model_weather.dart';
import '../loc_permission.dart';

class GetWeather {
  Future<Weather> fetchWeather(lati, long, context) async {
    print(lati);
    print(long);
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$long&appid=$apiId&units=metric");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("fetch weather ");
      return Weather.fromJson(body);
    }
   
    return throw showNotification(context);
  }
}

// }

