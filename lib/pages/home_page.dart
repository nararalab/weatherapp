import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:weatherapp/services/weather_api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 정상동작 확인을 위한 테스트 코드
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchWeather();
  // }

  // _fetchWeather() {
  //   WeatherRepository(
  //           weatherApiServices: WeatherApiServices(httpClient: http.Client()))
  //       .fetchWeather('Seoul');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('날씨'),
      ),
      body: const Center(
        child: Text('홈'),
      ),
    );
  }
}
