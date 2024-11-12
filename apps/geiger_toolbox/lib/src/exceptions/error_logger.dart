import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'error_logger.g.dart';

class ErrorLogger {
  final _log = Logger();
  void logError(Object error, StackTrace? stackTrace) {
    // * This can be replaced with a call to a crash reporting tool
    // like sentry
    _log.d('Debug log => $error, $stackTrace');
  }

  void logAppException(AppException exception) {
    //* This can be replaced with a call to a crash reporting tool
    _log.d("Debug log => $exception");
  }

   void logInfo(String message) {
    _log.i("Info log => $message");
  }
}

@riverpod
ErrorLogger errorLogger(Ref ref) {
  return ErrorLogger();
}
