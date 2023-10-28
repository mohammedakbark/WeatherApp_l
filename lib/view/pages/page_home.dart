import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/model_forcastdata.dart';
import 'package:weather_app/utils/constant.dart';

import 'package:weather_app/viewmodel/provider/provider_serchbar.dart';
import 'package:weather_app/viewmodel/provider/provider_theme.dart';
import '../../model/model_weather.dart';
import '../../viewmodel/descreption_image.dart';
import '../../viewmodel/api_response/response_forcastdata.dart';
import '../../viewmodel/api_response/responce_weather.dart';
import '../../viewmodel/loc_permission.dart';
import '../widgets/currentWeather/widget_locationdata.dart';
import '../widgets/currentWeather/widget_sampledata.dart';
import '../widgets/forcast/widget_oneweek_forcast.dart';
import '../widgets/forcast/widget_singleday_forcastdatas.dart';
import '../widgets/tools/widget_drawer.dart';
import '../widgets/tools/widget_searchbar.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController searchBarController = TextEditingController();
  Weather? weather;
  LocPermissionProvider locPermissionProvider = LocPermissionProvider();

  GetWeather getweather = GetWeather();

  ForcastWeather? forcastweather = ForcastWeather();

  GetForcast getforcast = GetForcast();
  String getday(final day) {
    String result = "";
    if (day != null) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
      result = DateFormat("EEE").format(time);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(context),
        builder: (context, snapshot) {
          return Consumer<ThemeProvider>(builder: (context, themeState, child) {
            return SafeArea(
                child: Scaffold(
              extendBodyBehindAppBar: true,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(4.0),
                    child: weather != null
                        ? const SizedBox()
                        : const Center(
                            child: LinearProgressIndicator(),
                          )),
                toolbarHeight: 80,
                elevation: 0,
                backgroundColor: themeState.getDarktheme
                    ? const Color.fromARGB(0, 255, 255, 255)
                    : const Color.fromARGB(0, 255, 255, 255),
                centerTitle: true,
                title: Consumer<SearchBarProvider>(
                  builder: (context, serchpro, child) {
                    return serchpro.serchBarEnabled
                        ? MySearchBar(
                            controller: searchBarController,
                          )
                        : Center(
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "WeatherApp",
                                  style: weatherTextStyle,
                                )),
                          );
                  },
                ),
                actions: [
                  Consumer<SearchBarProvider>(
                      builder: (context, serchpro, child) {
                    return Center(
                      child: IconButton(
                        onPressed: () {
                          serchpro.isenabled();
                        },
                        icon: const Icon(Icons.search),
                      ),
                    );
                  }),
                  const SizedBox(
                    width: 25,
                  )
                ],
              ),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: themeState.getDarktheme
                    ? darkbgGradientBXDec
                    : lightbgGradientBXDec,
                child: RefreshIndicator(
                  onRefresh: () => locPermissionProvider
                      .getCurrentLocation()
                      .then((value) => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()))),
                  child: CustomScrollView(slivers: [
                    SliverAppBar(
                      elevation: 0,
                      toolbarHeight: 50,
                      expandedHeight: 400,
                      collapsedHeight: 50,
                      stretch: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: locationData(
                              context: context,
                              weather: weather,
                              themestate: themeState,
                              location:
                                  "${weather?.country ?? countrycode} | $localitys",
                              temperature: weather != null
                                  ? "${weather?.temperature?.toInt()}°"
                                  : "",
                              description: "${weather?.description ?? ""} ",
                              image: weatherConditions(obj: weather))),
                      leading: const Text(""),
                      backgroundColor: themeState.getDarktheme
                          ? const Color.fromARGB(0, 255, 255, 255)
                          : const Color.fromARGB(0, 255, 255, 255),
                    ),
                    SliverToBoxAdapter(
                      child: Column(children: [
                        smapleData(
                            themestate: themeState,
                            context: context,
                            humidity: "${weather?.humidity ?? "..."}%",
                            maxTemp: "${weather?.tempMax?.toInt() ?? "..."}°",
                            wind: "${weather?.wind?.toInt() ?? "..."} km/h"),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 5),
                          child: Text("Today", style: headStyle),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 5.2,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return singleDayForcastData(
                                  context: context,
                                  themestate: themeState,
                                  indextt: index,
                                  weather: weather,
                                  obj: forcastweather,
                                  time: weather != null
                                      ? "${forcastweather?.list?[index].dtTxt} "
                                      : "",
                                  temperrature:
                                      "${forcastweather?.list?[index].temp?.toInt() ?? "0"}°",
                                  description:
                                      "${forcastweather?.list?[index].description ?? "..."} ",
                                  humidity:
                                      "${forcastweather?.list?[index].humidityy ?? "0"}%",
                                  wind:
                                      "${forcastweather?.list?[index].wind?.toInt() ?? "0"} km/h",
                                );
                              }),
                        ),
                        const Text(" 5 Day Forcast", style: headStyle),
                        SingleChildScrollView(
                          child: GestureDetector(
                            child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: Color.fromARGB(47, 0, 0, 0)),
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                width: double.infinity,
                                child: ListView.separated(
                                    itemCount: 40,
                                    // itemCount: forcastweather!.list!.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemBuilder: ((context, index) => oneWeekForcast(
                                        index: index,
                                        themestate: themeState,
                                        weather: weather,
                                        obj: forcastweather,
                                        day: getday(
                                            forcastweather?.list?[index].dt),
                                        time: weather != null
                                            ? "${forcastweather?.list?[index].dtTxt}"
                                            : "",
                                        minTemp:
                                            "${forcastweather?.list?[index].tempMin?.toInt() ?? "0"}°",
                                        maxTemp:
                                            "${forcastweather?.list?[index].tempMax?.toInt() ?? "0"}°",
                                        temp:
                                            "${forcastweather?.list?[index].temp?.toInt() ?? "0"}°")))),
                          ),
                        ),
                        // TextButton(
                        TextButton(
                          child: const Text('See All',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            // showModalBottomSheet<void>(
                            //   context: context,
                            //   builder: (BuildContext context) => ListView.builder(
                            //       itemCount: forcastweather?.list?.length,
                            //       itemBuilder: ((context, index) => oneWeekForcast(
                            //           index: index,
                            //           obj: forcastweather,
                            //           date:
                            //               "${forcastweather?.list?[index].dtTxt}",
                            //           descreption:
                            //               "${forcastweather?.list?[index].description}",
                            //           temp:
                            //               "${forcastweather?.list?[index].temp?.toInt() ?? "0"}°"))),
                            // );
                          },
                        ),
                      ]),
                    ),
                  ]),
                ),
              ),
              drawer: myDrawer(themestate: themeState, context: context),
            ));
          });
        });
  }

  Future<void> fetchData(context) async {
    weather = await getweather.fetchWeather(lat, lon, context);
    forcastweather = await getforcast.fetchForcastWeather(lat, lon, context);
  }
}
// TextButton(
//                               child: const Text('See All',
//                                   style: TextStyle(
//                                       color: Colors.amber,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold)),
//                               onPressed: () {
//                                 showModalBottomSheet<void>(
//                                     showDragHandle: true,
//                                     context: context,
//                                     builder: (BuildContext context) =>
//                                         fiveDayForcast());
//                               },
//                             ),