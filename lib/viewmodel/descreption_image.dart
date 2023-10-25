import 'package:weather_app/model/model_forcastdata.dart';
import 'package:weather_app/model/model_weather.dart';
import 'package:weather_app/utils/constant.dart';

weatherConditions({Weather? obj,ForcastWeather? obj2,myindext}) {
 
 
  switch (obj?.description ?? obj2?.list?[myindext].description??"") {
    case "light rain":
      return "assets/lightrain.png";
    case "clear sky":
      return "assets/clearsky.png";
    case "few clouds":
      return "assets/fewclouds.png";
    case "scattered clouds":
      return "assets/scatterdclouds.png";
    case "broken clouds":
      return "assets/brokenclouds.png";
    case "shower rain":
      return "assets/showerrain.png";
    case "rain":
      return "assets/rain.png";
    case "thunderstorm":
      return "assets/thunderstrom.png";
    case "snow":
      return "assets/snow.png";
    case "mist":
      return "assets/mist.png";
    case "haze":
      return "assets/haze.png";
    case "overcast clouds":
      return "assets/overcastclouds.png";
    case "":
      return "assets/error.png";
    default:
      return "assets/default.png";
  }
}
