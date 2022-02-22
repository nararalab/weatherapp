class WeatherException implements Exception {
  String message;
  WeatherException([this.message = '오류발생함']) {
    message = '날씨 예외 : $message';
  }

  @override
  String toString() {
    return message;
  }
}
