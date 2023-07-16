import 'package:flutter/foundation.dart';

class CustomApiException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  @override
  String toString() {
    if (kDebugMode) {
      print('http error : $_message');
    }
    return '$_prefix$_message';
  }

  CustomApiException(this._message, this._prefix);
}

class FetchDataException extends CustomApiException {
  FetchDataException(message) : super(message, 'Failed to get data :\n');
}

class BadRequestExcetion extends CustomApiException {
  BadRequestExcetion(message) : super(message, 'Invalid Request :\n');
}

class UnauthorisedException extends CustomApiException {
  UnauthorisedException(message) : super(message, 'Unauthorised :\n');
}

class InvalidInputException extends CustomApiException {
  InvalidInputException(message) : super(message, 'Invalid Input :\n');
}
