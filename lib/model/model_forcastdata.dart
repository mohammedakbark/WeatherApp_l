

class ForcastWeather {
  int? timezone;
  int? sunrise;
  int? sunset;
  List<ListElement>? list;

  ForcastWeather({
    this.timezone,
    this.sunrise,
    this.sunset,
    this.list,
  });
  ForcastWeather.fromJson(Map<String, dynamic> json) {
    timezone = json["city"]["timezone"];
    sunrise = json["city"]["sunrise"];
    sunset = json["city"]["sunset"];

    list = List<ListElement>.from(
        json["list"].map((e) => ListElement.fromJson(e)));
  }
}

class ListElement {
  num? temp;
  int? humidityy;
  String? description;
  num? wind;
  String? dtTxt;
  // List<WeatherElement>? weatherList;
  ListElement(
      {this.humidityy, this.temp, this.description, this.wind, this.dtTxt});
  ListElement.fromJson(Map<String, dynamic> json) {
    temp = json["main"]["temp"];
    humidityy = json["main"]["humidity"];
    description = json["weather"][0]["description"];
    wind = json["wind"]["speed"];
    dtTxt = json["dt_txt"];
    // weatherList = List<WeatherElement>.from(json["weather"].map((e) => weatherList.fromJson(e)));
  }
}

// class WeatherElement {
//   String? description;
//   WeatherElement({
//     this.description,
//   });
//   WeatherElement.fromJson(Map<String, dynamic> json) {
//     description = json["weather"][0]["description"];
//   }
// }

// class ForcastWeather {
//   String cod;
//   int message;
//   int cnt;
//   List<ListElement> list;
//   City city;

//   ForcastWeather({
//     required this.cod,
//     required this.message,
//     required this.cnt,
//     required this.list,
//     required this.city,
//   });

//   factory ForcastWeather.fromJson(Map<String, dynamic> json) => ForcastWeather(
//         cod: json["cod"],
//         message: json["message"],
//         cnt: json["cnt"],
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//         city: City.fromJson(json["city"]),
//       );
// }

// class City {
//   int id;
//   String name;
//   Coord coord;
//   String country;
//   int population;
//   int timezone;
//   int sunrise;
//   int sunset;

//   City({
//     required this.id,
//     required this.name,
//     required this.coord,
//     required this.country,
//     required this.population,
//     required this.timezone,
//     required this.sunrise,
//     required this.sunset,
//   });

//   factory City.fromJson(Map<String, dynamic> json) => City(
//         id: json["id"],
//         name: json["name"],
//         coord: Coord.fromJson(json["coord"]),
//         country: json["country"],
//         population: json["population"],
//         timezone: json["timezone"],
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//       );
// }

// class Coord {
//   double lat;
//   double lon;

//   Coord({
//     required this.lat,
//     required this.lon,
//   });

//   factory Coord.fromJson(Map<String, dynamic> json) => Coord(
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//       );
// }

// class ListElement {
//   int dt;
//   MainClass main;
//   List<Weather> weather;
//   Clouds clouds;
//   Wind wind;
//   int visibility;
//   double pop;
//   Rain rain;
//   Sys sys;
//   DateTime dtTxt;

//   ListElement({
//     required this.dt,
//     required this.main,
//     required this.weather,
//     required this.clouds,
//     required this.wind,
//     required this.visibility,
//     required this.pop,
//     required this.rain,
//     required this.sys,
//     required this.dtTxt,
//   });

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         dt: json["dt"],
//         main: MainClass.fromJson(json["main"]),
//         weather:
//             List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         clouds: Clouds.fromJson(json["clouds"]),
//         wind: Wind.fromJson(json["wind"]),
//         visibility: json["visibility"],
//         pop: json["pop"]?.toDouble(),
//         rain: Rain.fromJson(json["rain"]),
//         sys: Sys.fromJson(json["sys"]),
//         dtTxt: DateTime.parse(json["dt_txt"]),
//       );
// }

// class Clouds {
//   int all;

//   Clouds({
//     required this.all,
//   });

//   factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
//         all: json["all"],
//       );
// }

// class MainClass {
//   double temp;
//   double feelsLike;
//   double tempMin;
//   double tempMax;
//   int pressure;
//   int seaLevel;
//   int grndLevel;
//   int humidity;
//   double tempKf;

//   MainClass({
//     required this.temp,
//     required this.feelsLike,
//     required this.tempMin,
//     required this.tempMax,
//     required this.pressure,
//     required this.seaLevel,
//     required this.grndLevel,
//     required this.humidity,
//     required this.tempKf,
//   });

//   factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
//         temp: json["temp"]?.toDouble(),
//         feelsLike: json["feels_like"]?.toDouble(),
//         tempMin: json["temp_min"]?.toDouble(),
//         tempMax: json["temp_max"]?.toDouble(),
//         pressure: json["pressure"],
//         seaLevel: json["sea_level"],
//         grndLevel: json["grnd_level"],
//         humidity: json["humidity"],
//         tempKf: json["temp_kf"]?.toDouble(),
//       );
// }

// class Rain {
//   double the3H;

//   Rain({
//     required this.the3H,
//   });

//   factory Rain.fromJson(Map<String, dynamic> json) => Rain(
//         the3H: json["3h"]?.toDouble(),
//       );
// }

// class Sys {
//   Pod pod;

//   Sys({
//     required this.pod,
//   });

//   factory Sys.fromJson(Map<String, dynamic> json) => Sys(
//         pod: podValues.map[json["pod"]]!,
//       );
// }

// enum Pod { D, N }

// final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

// class Weather {
//   int id;
//   MainEnum main;
//   String description;
//   String icon;

//   Weather({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         id: json["id"],
//         main: mainEnumValues.map[json["main"]]!,
//         description: json["description"],
//         icon: json["icon"],
//       );
// }

// enum MainEnum { CLEAR, CLOUDS, RAIN }

// final mainEnumValues = EnumValues({
//   "Clear": MainEnum.CLEAR,
//   "Clouds": MainEnum.CLOUDS,
//   "Rain": MainEnum.RAIN
// });

// class Wind {
//   double speed;
//   int deg;
//   double gust;

//   Wind({
//     required this.speed,
//     required this.deg,
//     required this.gust,
//   });

//   factory Wind.fromJson(Map<String, dynamic> json) => Wind(
//         speed: json["speed"]?.toDouble(),
//         deg: json["deg"],
//         gust: json["gust"]?.toDouble(),
//       );
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
