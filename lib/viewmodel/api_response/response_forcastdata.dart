import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/model_forcastdata.dart';
import '../../utils/constant.dart';

class GetForcast {
  Future<ForcastWeather> fetchForcastWeather(lat, lon, context) async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiId&units=metric");
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("kjkkkkkkkkkkkkkkkkkk");
      return ForcastWeather.fromJson(body);
    } else {
      // Future<dynamic> aaav() async {
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
  }
  // return ForcastWeather();
}
// }
