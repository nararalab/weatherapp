import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String weatherStatename;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;
  Weather({
    required this.weatherStatename,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_weather'][0];

    return Weather(
      weatherStatename: consolidatedWeather['weather_state_name'],
      weatherStateAbbr: consolidatedWeather['weather_state_abbr'],
      created: consolidatedWeather['created'],
      minTemp: consolidatedWeather['min_temp'],
      maxTemp: consolidatedWeather['max_temp'],
      theTemp: consolidatedWeather['the_temp'],
      title: json['title'],
      woeid: json['woeid'],
      lastUpdated: DateTime.now(),
    );
  }

  factory Weather.initial() => Weather(
        weatherStatename: '',
        weatherStateAbbr: '',
        created: '',
        minTemp: 100.0,
        maxTemp: 100.0,
        theTemp: 100.0,
        title: '',
        woeid: -1,
        lastUpdated: DateTime(1970),
      );

  @override
  List<Object> get props {
    return [
      weatherStatename,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      theTemp,
      title,
      woeid,
      lastUpdated,
    ];
  }

  @override
  String toString() {
    return 'Weather(weatherStatename: $weatherStatename, weatherStateAbbr: $weatherStateAbbr, created: $created, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, title: $title, woeid: $woeid, lastUpdated: $lastUpdated)';
  }
}
