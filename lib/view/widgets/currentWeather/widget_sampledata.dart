import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

Widget smapleData({
  required themestate,
  required context,
 
  required String humidity,
  required String maxTemp,
  required String wind,
}) {
  return Container(
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
                      ? defaultWhiteColor
                      : cityAndTemperatureColor,
                  scale: 10,
                ),
                Text(
                  maxTemp,
                  style: TextStyle(
                    color: themestate.getDarktheme
                        ? defaultWhiteColor
                        : cityAndTemperatureColor,
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
                scale: 10,
              ),
              Text(humidity,
                  style: TextStyle(
                    color: themestate.getDarktheme
                        ? defaultWhiteColor
                        : cityAndTemperatureColor,
                    fontSize: 15,
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
                    ? defaultWhiteColor
                    : cityAndTemperatureColor,
                scale: 10,
              ),
              Text(wind,
                  style: TextStyle(
                    color: themestate.getDarktheme
                        ? defaultWhiteColor
                        : cityAndTemperatureColor,
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
