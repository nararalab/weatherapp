import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/weather_provider.dart';

import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  late final WeatherProvider _weatherProv;

  @override
  void initState() {
    super.initState();
    _weatherProv = context.read<WeatherProvider>();
    _weatherProv.addListener(_registerListener);
  }

  @override
  void dispose() {
    _weatherProv.removeListener(_registerListener);
    super.dispose();
  }

  void _registerListener() {
    final WeatherState ws = context.read<WeatherProvider>().state;

    if (ws.status == WeatherStatus.error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(ws.error.errMsg),
          );
        },
      );
    }
  }

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
      body: _showWeather(),
    );
  }

  Widget _showWeather() {
    final weatherState = context.watch<WeatherProvider>().state;

    if (weatherState.status == WeatherStatus.initial) {
      return const Center(
        child: Text(
          '도시를 선택하세요',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }

    if (weatherState.status == WeatherStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (weatherState.status == WeatherStatus.error &&
        weatherState.weather.title == '') {
      return const Center(
        child: Text(
          '도시를 선택하세요',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }

    return Center(
      child: Text(
        weatherState.weather.title,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
