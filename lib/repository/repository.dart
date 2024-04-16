

import 'package:otenki/service/weather_api_client.dart';
//リポジトリー
class Repository {
  final _api = WeatherApiClient();
  dynamic fetchWeather(String location) async {
    return _api.fetchWeather(location);
  }
}