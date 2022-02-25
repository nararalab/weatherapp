import 'package:http/http.dart' as http;

String httpErrorHandler(http.Response response) {
  final statusCode = response.statusCode;
  final reasonPhrase = response.reasonPhrase;

  final String errorMessage = '에러남\n상태코드: $statusCode\n상태메시지:$reasonPhrase';

  print("[디버깅]" + errorMessage);
  return errorMessage;
}
