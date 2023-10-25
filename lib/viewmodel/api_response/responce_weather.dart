import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constant.dart';
import 'package:http/http.dart' as http;
import '../../../model/model_weather.dart';

class GetWeather {
  Future<Weather> fetchWeather(lati, long, context) async {
    print(lati);
    print(long);
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$long&appid=$apiId&units=metric");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("""""" """""" """""" """object""" """""" """""" """""");
      return Weather.fromJson(body);
    } else {
      print("/////////////////////api response error///////////////");
      return throw showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
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
  }
}
