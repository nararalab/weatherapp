import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:weatherapp/services/weather_api_services.dart';

import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;

  // 정상동작 확인을 위한 테스트 코드
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchWeather();
  // }

  // _fetchWeather() {
  //   // WeatherRepository(
  //   //         weatherApiServices: WeatherApiServices(httpClient: http.Client()))
  //   //     .fetchWeather('Seoul');
  //   WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
  //     context.read<WeatherProvider>().fetchWeather('Seoul');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('날씨'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }),
              );

              print('city: $_city');

              if (_city != null) {
                context.read<WeatherProvider>().fetchWeather(_city!);
              }
            },
          )
        ],
      ),
      body: const Center(
        child: Text('홈'),
      ),
    );
  }
}
