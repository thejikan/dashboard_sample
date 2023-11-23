import 'package:flutter/material.dart';

IconData SelectWeatherIcon(int code) {
  return Icons.add;
  switch (code) {
    case 0:/*
      return WeatherIcons.day_sunny;
    case 1:
    case 2:
    case 3:
      return WeatherIcons.day_sunny_overcast;
    case 45:
    case 48:
      return WeatherIcons.day_fog;
    case 51:
    case 53:
    case 55:
      return WeatherIcons.day_light_wind;
    case 56:
    case 57:
      return WeatherIcons.day_hail;
    case 61:
    case 63:
    case 65:
      return WeatherIcons.day_rain;
    case 66:
    case 67:
      return WeatherIcons.day_rain_mix;
    case 71:
    case 73:
    case 75:
      return WeatherIcons.snowflake_cold;
    case 77:
      return WeatherIcons.day_snow;
    case 80:
    case 81:
    case 82:
      return WeatherIcons.day_rain;
    case 85:
    case 86:
      return WeatherIcons.day_snow;
    case 95:
      return WeatherIcons.day_storm_showers;
    case 96:
    case 99:
      return WeatherIcons.day_snow_thunderstorm;
    default:
      return WeatherIcons.day_sunny;*/
  }
}

String SelectWeatherDetails(int code) {
  switch (code) {
    case 0:
      return 'Clear sky';
    case 1:
    case 2:
    case 3:
      return 'Mainly clear, partly cloudy, and overcast';
    case 45:
    case 48:
      return 'Fog and depositing rime fog';
    case 51:
    case 53:
    case 55:
      return 'Drizzle: Light, moderate, and dense intensity';
    case 56:
    case 57:
      return 'Freezing Drizzle: Light and dense intensity';
    case 61:
    case 63:
    case 65:
      return 'Rain: Slight, moderate and heavy intensity';
    case 66:
    case 67:
      return 'Freezing Rain: Light and heavy intensity';
    case 71:
    case 73:
    case 75:
      return 'Snow fall: Slight, moderate, and heavy intensity';
    case 77:
      return 'Snow grains';
    case 80:
    case 81:
    case 82:
      return 'Rain showers: Slight, moderate, and violent';
    case 85:
    case 86:
      return 'Snow showers slight and heavy';
    case 95:
      return 'Thunderstorm: Slight or moderate';
    case 96:
    case 99:
      return 'Thunderstorm with slight and heavy hail';
    default:
      return 'Clear sky';
  }
}