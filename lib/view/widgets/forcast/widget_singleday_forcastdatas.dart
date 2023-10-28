import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/colors.dart';
import '../../../viewmodel/descreption_image.dart';
import '../../../viewmodel/provider/provider_theme.dart';

Widget singleDayForcastData({
  weather,
  required indextt,
  required obj,
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

  print(timeOnly);

  return Column(
    children: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(47, 0, 0, 0)),
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * .25,
          height: MediaQuery.of(context).size.height * .15,
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              timeOnly,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: themestate.getDarktheme
                    ? defaultWhiteColor
                    : cityAndTemperatureColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      temperrature,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: themestate.getDarktheme
                            ? defaultWhiteColor
                            : cityAndTemperatureColor,
                      ),
                    ),
                    weather != null
                        ? Image.asset(
                            weatherConditions(obj2: obj, myindext: indextt),
                            scale: 15,
                          )
                        : Lottie.asset(
                            "assets/loadingImage.json",
                            height: 40,
                            width: 40,
                          )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),

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
                        style: TextStyle(
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
                        style: TextStyle(
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
            const SizedBox(
              height: 9,
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
          ])),
      // Text(
      //   timeOnly,
      //   style: TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.w200,
      //     color: themestate.getDarktheme
      //         ? defaultWhiteColor
      //         : cityAndTemperatureColor,
      //   ),
      // ),
    ],
  );
}
