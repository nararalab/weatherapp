import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/temp_settings_provider.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/weather_api_services.dart';

import 'pages/home_page.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherRepository>(create: (context) {
          final WeatherApiServices weatherApiServices =
              WeatherApiServices(httpClient: http.Client());
          return WeatherRepository(weatherApiServices: weatherApiServices);
        }),
        ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider(
            weatherRepository: context.read<WeatherRepository>(),
          ),
        ),
        ChangeNotifierProvider<TempSettingsProvider>(
          create: (context) => TempSettingsProvider(),
        ),
      ],
      child: MaterialApp(
        title: '날씨앱',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
