import 'dart:io';

Map<String, String> getHeaders({String? token = null}) {
  if (token != null && token.isNotEmpty) {
    return {
      HttpHeaders.connectionHeader: 'close',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }
  return {
    HttpHeaders.connectionHeader: 'close',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };
}
