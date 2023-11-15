import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/model_forcastdata.dart';

import '../../../utils/colors.dart';

Widget oneWeekForcast(
    {required String time,
    required String day,
    required String temp,
    required String minTemp,
    required String maxTemp,
    weather,
    themestate,
    ForcastWeather? obj,
    index}) {
  DateFormat timeFormat = DateFormat("h a");
  String timeOnly = "";
  if (time.isNotEmpty) {
    DateTime datetime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
    timeOnly = timeFormat.format(datetime);
  }
  // print(timeOnly);
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
    decoration: const BoxDecoration(
        color: Color.fromARGB(47, 0, 0, 0),
        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                    style: GoogleFonts.orbitron(
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
            ? Image.network(
                "https://openweathermap.org/img/wn/${obj?.list?[index].icon}.png")
            : Lottie.asset(
                "assets/loadingImage.json",
                height: 80,
                width: 80,
              ),
        Text(maxTemp,
            style: GoogleFonts.orbitron(
              color: themestate.getDarktheme
                  ? defaultWhiteColor
                  : cityAndTemperatureColor,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            )),
        Text(minTemp,
            style: GoogleFonts.orbitron(
              color: themestate.getDarktheme
                  ? blendWhite
                  : humidityWindAndDescriptionColor,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            )),
      ],
    ),
  );
}
