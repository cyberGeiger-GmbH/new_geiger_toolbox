import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
part 'error_logger.g.dart';

class ErrorLogger {
  final _log = Logger();
  FutureOr<void> logError(Object error, StackTrace? stackTrace) async{
      await Sentry.captureException(error, stackTrace: stackTrace);
    _log.d('Debug log => $error, $stackTrace');
  }

  FutureOr<void> logAppException(AppException exception) async {
    await Sentry.captureException(exception);
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
