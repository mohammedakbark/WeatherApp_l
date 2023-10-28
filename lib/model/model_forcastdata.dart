class ForcastWeather {
  // int? timezone;
  // int? sunrise;
  // int? sunset;
  List<ListElement>? list;

  ForcastWeather({
    // this.timezone,
    // this.sunrise,
    // this.sunset,
    this.list,
  });
  ForcastWeather.fromJson(Map<String, dynamic> json) {
    // timezone = json["city"]["timezone"];
    // sunrise = json["city"]["sunrise"];
    // sunset = json["city"]["sunset"];

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
  int? dt;
  num? tempMin;
  num? tempMax;
  // List<WeatherElement>? weatherList;
  ListElement(
      {this.humidityy,
      this.temp,
      this.description,
      this.wind,
      this.dtTxt,
      this.dt,
      this.tempMax,
      this.tempMin});
  ListElement.fromJson(Map<String, dynamic> json) {
    temp = json["main"]["temp"];
    humidityy = json["main"]["humidity"];
    tempMin = json["main"]["temp_min"];
    tempMax = json["main"]["temp_max"];
    description = json["weather"][0]["description"];
    wind = json["wind"]["speed"];
    dt = json["dt"];
    dtTxt = json["dt_txt"];
  }
}


