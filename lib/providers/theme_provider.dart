import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

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

class ThemeProvider extends StateNotifier<ThemeState> with LocatorMixin {
  ThemeProvider() : super(ThemeState.initial());

  @override
  void update(Locator watch) {
    final wp = watch<WeatherState>().weather;

    if (wp.theTemp > dataWarmOrNot) {
      state = state.copyWith(appTheme: AppTheme.light);
    } else {
      state = state.copyWith(appTheme: AppTheme.dark);
    }

    super.update(watch);
  }
}
