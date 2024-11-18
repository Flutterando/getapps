import 'package:flutter/foundation.dart';

abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppException(this.message, [this.stackTrace]) {
    if (stackTrace != null) {
      debugPrint('AppException: $message\n$stackTrace');
    } else {
      debugPrint('AppException: $message');
    }
  }

  @override
  String toString() => message;
}
