import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

Widget smapleData({
  required themestate,
  required context,
  required String humidity,
  required String maxTemp,
  required String wind,
}) {
  return Container(
    height: MediaQuery.of(context).size.height * .2,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(47, 0, 0, 0)),
    margin: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 3.5,
            height: MediaQuery.of(context).size.height / 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/lowTemp.png",
                  color: themestate.getDarktheme
                      ? blendWhite
                      : humidityWindAndDescriptionColor,
                  scale: 10,
                ),
                Text(
                  maxTemp,
                  style: GoogleFonts.orbitron(
                    color: themestate.getDarktheme
                        ? blendWhite
                        : humidityWindAndDescriptionColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          height: MediaQuery.of(context).size.height / 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/humidity.png",
                color: themestate.getDarktheme
                    ? defaultWhiteColor
                    : cityAndTemperatureColor,
                scale: 5,
              ),
              Text(humidity,
                  style: GoogleFonts.orbitron(
                    color: themestate.getDarktheme
                        ? defaultWhiteColor
                        : cityAndTemperatureColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  )),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          height: MediaQuery.of(context).size.height / 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/wind (1).png",
                color: themestate.getDarktheme
                    ? blendWhite
                    : humidityWindAndDescriptionColor,
                scale: 10,
              ),
              Text(wind,
                  style: GoogleFonts.orbitron(
                    color: themestate.getDarktheme
                        ? blendWhite
                        : humidityWindAndDescriptionColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  )),
            ],
          ),
        )
      ],
    ),
  );
}
