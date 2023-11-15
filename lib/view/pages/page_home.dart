import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/model_forcastdata.dart';
import 'package:weather_app/utils/constant.dart';

import 'package:weather_app/viewmodel/provider/provider_serchbar.dart';
import 'package:weather_app/viewmodel/provider/provider_theme.dart';
import '../../model/model_weather.dart';
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
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchBarController = TextEditingController();

  Weather? weather;

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
  void initState() {
    super.initState();
    fetchData(context).then((x) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
   
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
            Consumer<SearchBarProvider>(builder: (context, serchpro, child) {
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
            onRefresh: () =>
                LocPermissionProvider().getCurrentLocation().then((value) {
              setState(() {});
            }),
            child: CustomScrollView(slivers: [
              SliverAppBar(
                elevation: 0,
                toolbarHeight: 40,
                expandedHeight: MediaQuery.of(context).size.height * .4,
                collapsedHeight: 40,
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
                        // image: weatherConditions(obj: weather)
                        image: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            "https://openweathermap.org/img/wn/${weather?.icon}.png",
                            fit: BoxFit.contain,
                          ),
                        ))),
                leading: const Text(""),
                backgroundColor: themeState.getDarktheme
                    ? const Color.fromARGB(0, 255, 255, 255)
                    : const Color.fromARGB(0, 255, 255, 255),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .89,
                  width: MediaQuery.of(context).size.width,
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
                      height: MediaQuery.of(context).size.height * .2,
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
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(" 5 Day Forcast", style: headStyle),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                        flex: 2,
                        child: ListView.builder(
                            itemCount: 40,
                            itemBuilder: ((context, index) => oneWeekForcast(
                                index: index,
                                themestate: themeState,
                                weather: weather,
                                obj: forcastweather,
                                day: getday(forcastweather?.list?[index].dt),
                                time: weather != null
                                    ? "${forcastweather?.list?[index].dtTxt}"
                                    : "",
                                minTemp:
                                    "${forcastweather?.list?[index].tempMin?.toInt() ?? "0"}°",
                                maxTemp:
                                    "${forcastweather?.list?[index].tempMax?.toInt() ?? "0"}°",
                                temp:
                                    "${forcastweather?.list?[index].temp?.toInt() ?? "0"}°")))),
                  ]),
                ),
              ),
            ]),
          ),
        ),
        drawer: myDrawer(themestate: themeState, context: context),
      ));
      // });
    });
  }

  Future<void> fetchData(context) async {
    weather = await getweather.fetchWeather(lat, lon, context);
    forcastweather = await getforcast.fetchForcastWeather(lat, lon, context);
  }
}
