# weatherapp

플루터 날씨앱

- ChangeNotifierProvider +
ChangeNotifierProxyProvider
- ChangeNotifierProvider + ProxyProvider
- StateNotifierProvider

## MetaWeather와 통신

> City name 로 woeid(Weather on Earth Id) 를 획득함

[https://www.metaweather.com/api/location/search?query=Seoul]

```json
[
  {
    "title": "Seoul",
    "location_type": "City",
    "woeid": 1132599,
    "latt_long": "37.557121,126.977379"
  }
]
```

> woeid 로 날씨정보를 획득함

[https://www.metaweather.com/api/location/1132599/]

```json
{
  "consolidated_weather": [
    {
      "id": 6114900406435840,
      "weather_state_name": "Heavy Cloud",
      "weather_state_abbr": "hc",
      "wind_direction_compass": "W",
      "created": "2022-02-22T10:09:37.372155Z",
      "applicable_date": "2022-02-22",
      "min_temp": -6.55,
      "max_temp": -0.65,
      "the_temp": -0.95,
      "wind_speed": 7.448780605238738,
      "wind_direction": 280.2054368530315,
      "air_pressure": 1032.5,
      "humidity": 34,
      "visibility": 13.552105702696254,
      "predictability": 71
    },
    {
      "id": 6603629432668160,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "WNW",
      "created": "2022-02-22T10:09:40.442220Z",
      "applicable_date": "2022-02-23",
      "min_temp": -9.29,
      "max_temp": 0.13,
      "the_temp": -2.085,
      "wind_speed": 5.85721793281105,
      "wind_direction": 297.83465194935917,
      "air_pressure": 1034.5,
      "humidity": 27,
      "visibility": 13.979919768551659,
      "predictability": 68
    },
    {
      "id": 6630688833929216,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "W",
      "created": "2022-02-22T10:09:43.468767Z",
      "applicable_date": "2022-02-24",
      "min_temp": -7.07,
      "max_temp": 3.745,
      "the_temp": 1.9149999999999998,
      "wind_speed": 4.078143239526498,
      "wind_direction": 275.0,
      "air_pressure": 1032.5,
      "humidity": 39,
      "visibility": 13.994521991569236,
      "predictability": 68
    },
    {
      "id": 4962299090567168,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "SW",
      "created": "2022-02-22T10:09:46.379652Z",
      "applicable_date": "2022-02-25",
      "min_temp": -1.825,
      "max_temp": 8.805,
      "the_temp": 6.58,
      "wind_speed": 4.686148912601076,
      "wind_direction": 228.30481849580133,
      "air_pressure": 1027.5,
      "humidity": 62,
      "visibility": 13.484376242742384,
      "predictability": 68
    },
    {
      "id": 4776511992233984,
      "weather_state_name": "Light Rain",
      "weather_state_abbr": "lr",
      "wind_direction_compass": "SW",
      "created": "2022-02-22T10:09:49.772494Z",
      "applicable_date": "2022-02-26",
      "min_temp": 0.845,
      "max_temp": 9.24,
      "the_temp": 8.53,
      "wind_speed": 8.476709030716615,
      "wind_direction": 224.6667720173256,
      "air_pressure": 1018.5,
      "humidity": 67,
      "visibility": 12.165515887218643,
      "predictability": 75
    },
    {
      "id": 4814638114930688,
      "weather_state_name": "Clear",
      "weather_state_abbr": "c",
      "wind_direction_compass": "W",
      "created": "2022-02-22T10:09:52.952549Z",
      "applicable_date": "2022-02-27",
      "min_temp": -0.81,
      "max_temp": 8.315,
      "the_temp": 5.33,
      "wind_speed": 5.1022729261115085,
      "wind_direction": 261.5,
      "air_pressure": 1023.0,
      "humidity": 47,
      "visibility": 9.999726596675416,
      "predictability": 68
    }
  ],
  "time": "2022-02-22T21:42:07.787722+09:00",
  "sun_rise": "2022-02-22T07:12:11.140341+09:00",
  "sun_set": "2022-02-22T18:18:15.748348+09:00",
  "timezone_name": "LMT",
  "parent": {
    "title": "South Korea",
    "location_type": "Country",
    "woeid": 23424868,
    "latt_long": "36.448151,127.850166"
  },
  "sources": [
    {
      "title": "BBC",
      "slug": "bbc",
      "url": "http://www.bbc.co.uk/weather/",
      "crawl_rate": 360
    },
    {
      "title": "Forecast.io",
      "slug": "forecast-io",
      "url": "http://forecast.io/",
      "crawl_rate": 480
    },
    {
      "title": "HAMweather",
      "slug": "hamweather",
      "url": "http://www.hamweather.com/",
      "crawl_rate": 360
    },
    {
      "title": "Met Office",
      "slug": "met-office",
      "url": "http://www.metoffice.gov.uk/",
      "crawl_rate": 180
    },
    {
      "title": "OpenWeatherMap",
      "slug": "openweathermap",
      "url": "http://openweathermap.org/",
      "crawl_rate": 360
    },
    {
      "title": "Weather Underground",
      "slug": "wunderground",
      "url": "https://www.wunderground.com/?apiref=fc30dc3cd224e19b",
      "crawl_rate": 720
    },
    {
      "title": "World Weather Online",
      "slug": "world-weather-online",
      "url": "http://www.worldweatheronline.com/",
      "crawl_rate": 360
    }
  ],
  "title": "Seoul",
  "location_type": "City",
  "woeid": 1132599,
  "latt_long": "37.557121,126.977379",
  "timezone": "Asia/Seoul"
}
```

## 작업순서

```bash
flutter create weatherapp
flutter pub add equatable
flutter pub add provider
flutter pub add http


flutter pub add state_notifier
flutter pub add flutter_state_notifier
```
