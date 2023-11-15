import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/model_forcastdata.dart';
import '../../../utils/colors.dart';

Widget singleDayForcastData({
  weather,
  required indextt,
  ForcastWeather? obj,
  required themestate,
  required context,
  required String time,
  required String temperrature,
  required String description,
  required String humidity,
  required String wind,
}) {
  String timeOnly = "";
  DateFormat timeFormat = DateFormat("hh:mm a");
  if (time.isNotEmpty) {
    DateTime datetime = DateFormat("dd-MM-yyyy HH:mm:ss").parse(time);
    timeOnly = timeFormat.format(datetime);
  }

  // print(timeOnly);

  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(47, 0, 0, 0)),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * .3,
      // height: MediaQuery.of(context).size.height * .2,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          timeOnly,
          style: GoogleFonts.orbitron(
            fontSize: 15,
            fontWeight: FontWeight.w200,
            color: themestate.getDarktheme
                ? defaultWhiteColor
                : cityAndTemperatureColor,
          ),
        ),

        Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  temperrature,
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: themestate.getDarktheme
                        ? defaultWhiteColor
                        : cityAndTemperatureColor,
                  ),
                ),
                weather != null
                    ? Image.network(
                        "https://openweathermap.org/img/wn/${obj?.list?[indextt].icon}.png")
                    : Lottie.asset(
                        "assets/loadingImage.json",
                        height: 40,
                        width: 40,
                      )
              ],
            )),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/humidity.png",
                  color: themestate.getDarktheme
                      ? blendWhite
                      : humidityWindAndDescriptionColor,
                  scale: 23,
                ),
                Text(humidity,
                    style: GoogleFonts.orbitron(
                      color: themestate.getDarktheme
                          ? blendWhite
                          : humidityWindAndDescriptionColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assets/wind (1).png",
                  color: themestate.getDarktheme
                      ? blendWhite
                      : humidityWindAndDescriptionColor,
                  scale: 23,
                ),
                Text(wind,
                    style: GoogleFonts.orbitron(
                      color: themestate.getDarktheme
                          ? blendWhite
                          : humidityWindAndDescriptionColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            )
          ],
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            description,
            style: TextStyle(
              color: themestate.getDarktheme
                  ? blendWhite
                  : humidityWindAndDescriptionColor,
              fontSize: 13,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),

        // Text(sunrise),
        // Text(sunset),
      ]));
}
