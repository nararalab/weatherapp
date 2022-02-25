import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:weatherapp/repositories/weather_repository.dart';

import '../models/custom_error.dart';
import '../models/weather.dart';

enum WeatherStatus { initial, loading, loaded, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final CustomError error;
  const WeatherState({
    required this.status,
    required this.weather,
    required this.error,
  });

  factory WeatherState.initial() {
    return WeatherState(
      status: WeatherStatus.initial,
      weather: Weather.initial(),
      error: const CustomError(),
    );
  }

  @override
  List<Object> get props => [status, weather, error];

  @override
  String toString() =>
      'WeatherState(status: $status, weather: $weather, error: $error)';

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomError? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }
}

class WeatherProvider extends StateNotifier<WeatherState> with LocatorMixin {
  WeatherState _state = WeatherState.initial();
  WeatherProvider() : super(WeatherState.initial());
  @override
  WeatherState get state => _state;

  Future<void> fetchWeather(String city) async {
    _state = _state.copyWith(status: WeatherStatus.loading);

    try {
      final Weather weather =
          await read<WeatherRepository>().fetchWeather(city);
      state = _state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      );
      print('[디버깅] state: $state');
    } on CustomError catch (e) {
      state = state.copyWith(
        status: WeatherStatus.error,
        error: e,
      );
      print('[디버깅] state: $state');
    }
  }
}
