import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/model_forcastdata.dart';
import 'package:weather_app/viewmodel/descreption_image.dart';
import 'package:weather_app/viewmodel/provider/provider_theme.dart';

import '../../utils/colors.dart';

Widget locationAndDescription({
  required String location,
  required String description,
}) {
  return Consumer<ThemeProvider>(builder: (context, themestate, child) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            location,
            style: TextStyle(
                color: themestate.getDarktheme
                    ? defaultWhiteColor
                    : cityAndTemperatureColor,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            style: TextStyle(
              color: themestate.getDarktheme
                  ? blendWhite
                  : humidityWindAndDescriptionColor,
              fontSize: 20,
              // fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  });
}

Widget data({
  required String humidity,
  required String temperature,
  required String wind,
}) {
  return Consumer<ThemeProvider>(builder: (context, themestate, child) {
    // final hight = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(47, 0, 0, 0)),
      margin: EdgeInsets.all(10),
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
                  "assets/humidity.png",
                  color: themestate.getDarktheme
                      ? blendWhite
                      : humidityWindAndDescriptionColor,
                  scale: 15,
                ),
                Text(humidity,
                    style: TextStyle(
                      color: themestate.getDarktheme
                          ? blendWhite
                          : humidityWindAndDescriptionColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.5,
            height: MediaQuery.of(context).size.height / 7,
            child: Center(
              child: Text(
                temperature,
                style: TextStyle(
                  color: themestate.getDarktheme
                      ? defaultWhiteColor
                      : cityAndTemperatureColor,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  scale: 15,
                ),
                Text(wind,
                    style: TextStyle(
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
  });
}

Widget forcastData({
  required indextt,
  required obj,
  // required context,
  required String time,
  required String temperrature,
  required String description,
  required String humidity,
  required String wind,
  required String sunrise,
  required String sunset,
}) {
  DateFormat timeFormat = DateFormat("HH:mm");
  DateTime datetime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
  String timeOnly = timeFormat.format(datetime);
  print(timeOnly);

  return Consumer<ThemeProvider>(builder: (context, themestate, child) {
    return Column(
      children: [
        Text(
          timeOnly,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: themestate.getDarktheme
                ? defaultWhiteColor
                : cityAndTemperatureColor,
          ),
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(47, 0, 0, 0)),
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(15),
            width: 120,
            height: 150,
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        weatherConditions(obj2: obj, myindext: indextt),
                        scale: 10,
                      ),
                      Text(
                        temperrature,
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: themestate.getDarktheme
                              ? defaultWhiteColor
                              : cityAndTemperatureColor,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
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
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
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
                            fontWeight: FontWeight.w900,
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
                            fontWeight: FontWeight.w900,
                          )),
                    ],
                  )
                ],
              ),

              // Text(sunrise),
              // Text(sunset),
            ])),
      ],
    );
  });
}

Widget myDrawer() {
  return Consumer<ThemeProvider>(builder: (contex, themestate, child) {
    return Drawer(
      child: ListView(children: [
        ListTile(
          leading: Image.asset(
            "assets/mode.png",
            color: humidityWindAndDescriptionColor,
            scale: 18,
          ),
          title: Row(
            children: [
              const Text(
                "Dark Mode",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
              const Spacer(
                flex: 1,
              ),
              FlutterSwitch(
                  duration: const Duration(milliseconds: 0),
                  activeColor: humidityWindAndDescriptionColor,
                  inactiveColor: humidityWindAndDescriptionColor,
                  inactiveIcon: Image.asset("assets/day.png"),
                  activeIcon: Image.asset("assets/night.png"),
                  width: 55,
                  height: 30,
                  value: themestate.getDarktheme,
                  onToggle: (selected) {
                    themestate.setDarktheme = selected;
                  }),
            ],
          ),
        )
      ]),
    );
  });
}
