import 'dart:async';
import 'dart:convert';
import 'package:authentication_repository/src/models.dart';
import 'package:common_repository/common_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  final apiBaseUrl = dotenv.env['API_BASE_URL'];

  Future<LoginResponse> login({
    required Map<String, dynamic> bodyForm,
  }) async {
    try {
      final uri = Uri.parse(
        '${apiBaseUrl}/login',
      );

      final response = await http.post(
        uri,
        headers: getHeaders(),
        body: jsonEncode(bodyForm),
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return LoginResponse.fromJson(
          jsonDecode(response.body),
        );
      }

      return throw ExceptionHandlers().getResponseMessage(response);
    } catch (exception) {
      return throw ExceptionHandlers().getExceptionString(exception);
    }
  }

  Future<RegisterResponse> register({
    required Map<String, dynamic> bodyForm,
  }) async {
    try {
      final uri = Uri.parse(
        '${apiBaseUrl}/register',
      );

      final response = await http.post(
        uri,
        headers: getHeaders(),
        body: jsonEncode(bodyForm),
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return RegisterResponse.fromJson(
          jsonDecode(response.body),
        );
      }

      return throw ExceptionHandlers().getResponseMessage(response);
    } catch (exception) {
      return throw ExceptionHandlers().getExceptionString(exception);
    }
  }
}
