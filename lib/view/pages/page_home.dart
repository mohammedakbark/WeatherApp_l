import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/model_forcastdata.dart';
import 'package:weather_app/utils/constant.dart';

import 'package:weather_app/view/widgets/widget_homepage.dart';
import 'package:weather_app/view/widgets/widget_searchbar.dart';
import 'package:weather_app/viewmodel/provider/provider_theme.dart';
// import 'package:weather_app/viewmodel/response_forcastdata.dart';

import '../../model/model_weather.dart';
import '../../viewmodel/descreption_image.dart';
import '../../viewmodel/api_response/response_forcastdata.dart';
import '../../viewmodel/api_response/responce_weather.dart';

class HomePage extends StatelessWidget {
  String? searchAddress;
  TextEditingController searchBarController = TextEditingController();
  HomePage({super.key, this.searchAddress});

  Weather? weather;

  GetWeather getweather = GetWeather();

  ForcastWeather? forcastweather;

  GetForcast getforcast = GetForcast();

  ListElement? listelement;
  final nowTime = DateFormat("HH:mm");
  // final currentDate = DateFormat('EEEE, MMM d h:mm a').format(DateTime.now());
  // DateTime date_time = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Consumer<ThemeProvider>(builder: (context, themeState, child) {
            return SafeArea(
                child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                toolbarHeight: 100,
                elevation: 0,
                backgroundColor:
                    themeState.getDarktheme ? Colors.black : Colors.white,
                centerTitle: true,
                title: MySearchBar(
                  controller: searchBarController,
                ),
                actions: [
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "WeatherApp",
                          style: weatherTextStyle,
                        )),
                  ),
                  const SizedBox(
                    width: 25,
                  )
                ],
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: themeState.getDarktheme
                    ? darkbgGradientBXDec
                    : lightbgGradientBXDec,
                child: Center(
                  child: Column(children: [
                    Stack(
                      children: [
                        Container(
                          decoration: themeState.getDarktheme
                              ? darkCircleBXDec
                              : lightCircleBXDec,
                          height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width,
                          child: locationAndDescription(
                            location: "${weather?.country} | $localitys",
                            description: "${weather?.description ?? ""}",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 100,
                            left: 50,
                            right: 50,
                          ),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Image.asset(
                                weatherConditions(
                                  obj: weather,
                                ),
                              )),
                        ),
                      ],
                    ),
                    data(
                        humidity: "${weather?.humidity ?? "0"}%",
                        temperature: "${weather?.temperature?.toInt() ?? "0"}°",
                        wind: "${weather?.wind?.toInt() ?? "0"} km/h"),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 20, top: 10),
                        child: Text("Today",
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,

                      // width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return forcastData(
                                indextt: index,
                                obj: forcastweather,
                                // time: "${nowTime.parse(forcastweather?.list?[index].dtTxt)}",
                                time: "${forcastweather?.list?[index].dtTxt}",
                                temperrature:
                                    "${forcastweather?.list?[index].temp?.toInt() ?? "0"}°",
                                description:
                                    "${forcastweather?.list?[index].description}",
                                humidity:
                                    "${forcastweather?.list?[index].humidityy}%",
                                wind:
                                    "${forcastweather?.list?[index].wind?.toInt()} km/h",
                                sunrise: "${forcastweather?.sunrise}",
                                sunset: "${forcastweather?.sunset}");
                          }),
                    )
                  ]),
                ),
              ),
              drawer: myDrawer(),
            ));
          });
        });
  }

  Future<void> fetchData(context) async {
    print(lon);
    print(lat);

    // String date_time_str = "2023-10-24 14:30:45";

    weather = await getweather.fetchWeather(lat, lon, context);
    forcastweather = await getforcast.fetchForcastWeather(lat, lon, context);
  }
}
