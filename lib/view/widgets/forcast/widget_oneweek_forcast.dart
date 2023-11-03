import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/colors.dart';
import '../../../viewmodel/descreption_image.dart';

Widget oneWeekForcast(
    {required String time,
    required String day,
    required String temp,
    required String minTemp,
    required String maxTemp,
    weather,
    themestate,
    obj,
    index}) {
  DateFormat timeFormat = DateFormat("h a");
  String timeOnly = "";
  if (time.isNotEmpty) {
    DateTime datetime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
    timeOnly = timeFormat.format(datetime);
  }
  // print(timeOnly);
  return Container(
    decoration: BoxDecoration(
        color: themestate.getDarktheme
            ? cityAndTemperatureColor
            : defaultWhiteColor,
        borderRadius:const BorderRadius.all(Radius.circular(10))),
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        weather != null
            ? Column(
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: themestate.getDarktheme
                          ? defaultWhiteColor
                          : cityAndTemperatureColor,
                    ),
                  ),
                  Text(
                    timeOnly,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: themestate.getDarktheme
                          ? defaultWhiteColor
                          : cityAndTemperatureColor,
                    ),
                  )
                ],
              )
            : Text(
                "Load...",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: themestate.getDarktheme
                      ? defaultWhiteColor
                      : cityAndTemperatureColor,
                ),
              ),
        weather != null
            ? Image.asset(
                weatherConditions(obj2: obj, myindext: index),
                scale: 10,
              )
            : Lottie.asset(
                "assets/loadingImage.json",
                height: 80,
                width: 80,
              ),
        Text(maxTemp,
            style: TextStyle(
              color: themestate.getDarktheme
                  ? defaultWhiteColor
                  : cityAndTemperatureColor,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )),
        Text(minTemp,
            style: TextStyle(
              color: themestate.getDarktheme
                  ? defaultWhiteColor
                  : cityAndTemperatureColor,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )),
      ],
    ),
  );
}
