class Weather {
  String? cityName;
  String? country;
  String? description;
  double? temperature;
  int? clouds;
  int? pressure;
  int? humidity;
  int? visibility;
  num? wind;
  int? dt;
  DateTime? time;
  Weather(
      {this.cityName,
      this.country,
      this.description,
      this.temperature,
      this.pressure,
      this.humidity,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.time});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    country = json["sys"]["country"];
    description = json["weather"][0]['description'];
    wind = json["wind"]["speed"];
    temperature = json["main"]["temp"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["visibility"];
    dt = json["dt"];
    clouds = json["clouds"]["all"];
  }

  
}
