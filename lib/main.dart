import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/temp_settings_provider.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/weather_api_services.dart';

import 'pages/home_page.dart';
import 'providers/theme_provider.dart';
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
        StateNotifierProvider<WeatherProvider, WeatherState>(
          create: (context) => WeatherProvider(),
        ),
        StateNotifierProvider<TempSettingsProvider, TempSettingsState>(
          create: (context) => TempSettingsProvider(),
        ),
        StateNotifierProvider<ThemeProvider, ThemeState>(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        title: '날씨앱',
        debugShowCheckedModeBanner: false,
        theme: context.watch<ThemeState>().appTheme == AppTheme.light
            ? ThemeData.light()
            : ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
