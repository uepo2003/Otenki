
import 'package:dio/dio.dart';
import 'package:otenki/model/weather.dart';
import 'package:flutter/material.dart';
//ウェザーAPIを呼び出しています
class WeatherApiClient {
  Future<Weather?> fetchWeather(String location) async {
    final dio = Dio();
    const appId = "9f8f3b1a33a7bff262b35a7bc40064be&units=metric";
    final url = "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$appId";
    var response = await dio.get(url);
    if(response.statusCode == 200){
      try{
        return Weather.fromJson(response.data);
      } catch (e) {
        debugPrint(e.toString());
        throw e.toString;
      }
    }
    throw "エラーが発生しました";
  }
}