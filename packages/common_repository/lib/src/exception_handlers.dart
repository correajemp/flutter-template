import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common_repository/src/models.dart';
import 'package:http/http.dart' as http;

String genericErrorMessage =
    'We\'re unable to process your request. Please try again later.';
String networkErrorMessage =
    'Connection failed. Please check your internet connection and try again.';
String httpErrorMessage =
    'Access Denied! You don\'t have permission to view this page. If you believe this is a mistake, please contact our support team.';
String formatErrorMessage =
    'Invalid format. Please check your data and try again.';
String timeoutErrorMessage =
    'Sorry, something\'s taking longer than expected. Please retry later or check your internet connection.';

int? responseStatusCode;
ErrorMessageResponse? errorMessageResponse;

class ExceptionHandlers {
  getResponseMessage(http.Response response) {
    responseStatusCode = response.statusCode;

    errorMessageResponse = ErrorMessageResponse.fromJson(
      jsonDecode(response.body),
    );
    String? errors = errorMessageResponse?.errors?.entries.first.value.first;
    String? message = errorMessageResponse?.message;
    String? responseMessage = jsonDecode(response.body)['message'];

    if (errors != null && errors.isNotEmpty) {
      return errors.toString();
    }

    if (message != null && message.isNotEmpty) {
      return message.toString();
    }

    if (responseMessage != null && responseMessage.isNotEmpty) {
      return responseMessage.toString();
    }

    return genericErrorMessage.toString();
  }

  getExceptionString(exception) {
    if (exception is SocketException) {
      return networkErrorMessage.toString();
    }
    if (exception is HttpException) {
      return httpErrorMessage.toString();
    }
    if (exception is FormatException) {
      return formatErrorMessage.toString();
    }
    if (exception is TimeoutException) {
      return timeoutErrorMessage.toString();
    }
    if (exception is BadRequestException) {
      return exception.message.toString();
    }
    if (exception is UnAuthorizedException) {
      return exception.message.toString();
    }
    if (exception is NotFoundException) {
      return exception.message.toString();
    }
    if (exception is FetchDataException) {
      return exception.message.toString();
    }
    if (exception is Exception) {
      return genericErrorMessage.toString();
    }
    return exception ?? genericErrorMessage.toString();
  }

  clearError() {
    responseStatusCode = null;
    errorMessageResponse = null;
  }
}

enum ResponseStatus {
  socket,
  http,
  format,
  timeout,
  badRequest,
  unAuthorized,
  notFound,
  fetchData,
  unknown,
}

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([
    this.message,
    this.prefix,
    this.url,
  ]);
}

class BadRequestException extends AppException {
  BadRequestException([
    String? message,
    String? url,
  ]) : super(
          message,
          'Bad request',
          url,
        );
}

class FetchDataException extends AppException {
  FetchDataException([
    String? message,
    String? url,
  ]) : super(
          message,
          'Unable to process the request',
          url,
        );
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([
    String? message,
    String? url,
  ]) : super(
          message,
          'Api not responding',
          url,
        );
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([
    String? message,
    String? url,
  ]) : super(
          message,
          'Unauthorized request',
          url,
        );
}

class NotFoundException extends AppException {
  NotFoundException([
    String? message,
    String? url,
  ]) : super(
          message,
          'Page not found',
          url,
        );
}
