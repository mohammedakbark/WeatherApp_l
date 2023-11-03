import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

Widget locationData(
    {required themestate,
    required String temperature,
    required String description,
    required String location,
    required dynamic image,
    context,
    weather}) {
  return SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height * .2,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10),
      child: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                location,
                style: TextStyle(
                    color: themestate.getDarktheme
                        ? defaultWhiteColor
                        : cityAndTemperatureColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w200),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                description,
                style: TextStyle(
                  color: themestate.getDarktheme
                      ? blendWhite
                      : humidityWindAndDescriptionColor,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    child: Text(
                      temperature,
                      style: TextStyle(
                        color: themestate.getDarktheme
                            ? defaultWhiteColor
                            : cityAndTemperatureColor,
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  weather != null
                      ? Image.asset(
                          image,
                          scale: 4,
                        )
                      : const CircularProgressIndicator()
                ],
              ),
            ),
          ],
        );
      }),
    ),
  );
}
