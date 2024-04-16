



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otenki/model/weather.dart';
import 'package:otenki/repository/repository.dart';

final cityNameProvider = StateProvider((ref) => "Tokyo");

final repositoryProvider = Provider((ref) => Repository());

final dataProvider = FutureProvider.autoDispose<Weather>((ref) async {
  final repository = ref.read(repositoryProvider);
  final cityName = ref.watch(cityNameProvider.notifier);

  return await repository.fetchWeather(cityName.state);
});
