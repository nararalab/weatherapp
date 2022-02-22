import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/constants/constants.dart';
import 'package:weatherapp/exceptions/weather_exception.dart';
import 'package:weatherapp/services/http_error_handler.dart';

import '../models/weather.dart';

class WeatherApiServices {
  final http.Client httpClient;
  WeatherApiServices({
    required this.httpClient,
  });

  Future<int> getWoeid(String city) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: apiHost,
      path: '/api/location/search/',
      queryParameters: {'query': city},
    );

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }

      final responseBody = json.decode(response.body);

      if (responseBody.isEmpty) {
        throw WeatherException('찾을수 없는 woeid $city');
      }

      if (responseBody.length > 1) {
        throw WeatherException('하나 이상의 woeid $city');
      }

      return responseBody[0]['woeid'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeather(int woeid) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: apiHost,
      path: '/api/location/$woeid',
    );

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 299) {
        throw Exception(httpErrorHandler(response));
      }

      final weatherJson = json.decode(response.body);
      final Weather weather = Weather.fromJson(weatherJson);

      print(weather);

      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
