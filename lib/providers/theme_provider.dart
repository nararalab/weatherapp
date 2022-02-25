import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:weatherapp/providers/weather_provider.dart';

import '../constants/constants.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  const ThemeState({
    this.appTheme = AppTheme.light,
  });

  factory ThemeState.initial() {
    return const ThemeState();
  }

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  List<Object> get props => [appTheme];
}

class ThemeProvider {
  final WeatherProvider weatherProvider;
  ThemeProvider({
    required this.weatherProvider,
  });

  ThemeState get state {
    if (weatherProvider.state.weather.theTemp > dataWarmOrNot) {
      return ThemeState();
    } else {
      return ThemeState(appTheme: AppTheme.dark);
    }
  }
}
