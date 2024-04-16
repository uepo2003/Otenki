
import 'package:freezed_annotation/freezed_annotation.dart';

part "weather.freezed.dart";
part "weather.g.dart";

//天気情報モデル
@freezed
class Weather with _$Weather {
  factory Weather({
    int? timezone,
    int? id,
    String? name,
    WeatherMain? main
  }) = _Weather;
  factory Weather.fromJson(Map<String, dynamic> json) => 
        _$WeatherFromJson(json);

  }

// 詳しい詳細情報
@freezed
class WeatherMain with _$WeatherMain {
  factory WeatherMain({
    double? temp,
    double? feels_like,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity
  }) =  _WeatherMain;
  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
   _$WeatherMainFromJson(json);
}