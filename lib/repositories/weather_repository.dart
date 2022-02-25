import 'package:weatherapp/models/custom_error.dart';
import 'package:weatherapp/services/weather_api_services.dart';

import '../exceptions/weather_exception.dart';
import '../models/weather.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final int woeid = await weatherApiServices.getWoeid(city);
      print('[디버깅] woeid: $woeid');

      final Weather weather = await weatherApiServices.getWeather(woeid);
      print('[디버깅] weather: $weather');

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
