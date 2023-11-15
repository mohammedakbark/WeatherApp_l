class ForcastWeather {
  List<ListElement>? list;

  ForcastWeather({
    this.list,
  });
  ForcastWeather.fromJson(Map<String, dynamic> json) {
    list = List<ListElement>.from(
        json["list"].map((e) => ListElement.fromJson(e)));
  }
}

class ListElement {
  num? temp;
  int? humidityy;
  String? description;
  dynamic icon;
  num? wind;
  String? dtTxt;
  int? dt;
  num? tempMin;
  num? tempMax;

  ListElement(
      {this.humidityy,
      this.icon,
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
    icon = json["weather"][0]["icon"];
    tempMin = json["main"]["temp_min"];
    tempMax = json["main"]["temp_max"];
    description = json["weather"][0]["description"];
    wind = json["wind"]["speed"];
    dt = json["dt"];
    dtTxt = json["dt_txt"];
  }
}
