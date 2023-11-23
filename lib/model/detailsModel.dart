import 'dart:convert';

import 'package:dashboard/model/weatherConfig.dart';


class DetailsModel {
  List<WeatherDetailsConfig> last3Days;
  List<WeatherDetailsConfig> nextWeekReport;
  WeatherDetailsConfig? todayReport;
  List<WeatherDetailsConfig> weatherReport;

  DetailsModel({
    this.last3Days = const [],
    this.nextWeekReport = const [],
    this.todayReport,
    this.weatherReport = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weatherReport': weatherReport,
    };
  }

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
      weatherReport: map['weatherReport'] as List<WeatherDetailsConfig>,
    );
  }

  factory DetailsModel.empty() {
    return DetailsModel(
      last3Days: [],
      nextWeekReport: [],
    );
  }

  factory DetailsModel.fromQueryMap(Map<String, dynamic> map) {
    return DetailsModel(
      weatherReport: map['weatherReport'] as List<WeatherDetailsConfig>? ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsModel.fromJson(String source) =>
      DetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
