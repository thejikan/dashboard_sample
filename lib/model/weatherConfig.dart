class WeatherDetailsConfig {
  String date;
  int weatherCode;
  double maxTemperature;
  double minTemperature;
  String sunrise;
  String sunset;

  WeatherDetailsConfig({
    required this.date,
    required this.weatherCode,
    required this.maxTemperature,
    required this.minTemperature,
    required this.sunrise,
    required this.sunset,
  });
}