import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import '../../../../model/model_weather.dart';

class GetWeather {
  Future<Weather> fetchWeather(lati, long, context) async {
    print(lati);
    print(long);
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$long&appid=$apiId&units=metric");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("api responding");
      return Weather.fromJson(body);
    }
    print("api response error");
    // Future<dynamic> aaa() async {
    return throw showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text("Notification"),
              content: const Text(
                  "Can't find the place you tried to search \nRetry to find another place"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("retry"))
              ],
            ));
  }

  // return Weather();
}
// }
