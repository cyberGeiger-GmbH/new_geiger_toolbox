import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
part 'app_logger.g.dart';

class AppLogger {
  AppLogger(this.ref);
  Logger get _log => ref.read(logHandlerProvider("AppLogger"));
  final Ref ref;
  FutureOr<void> logError(Object error, StackTrace? stackTrace) async {
    await Sentry.captureException(error, stackTrace: stackTrace);
    _log.e('$error, $stackTrace');
  }

  FutureOr<void> logAppException(AppException exception) async {
    await Sentry.captureException(exception);
    _log.e("$exception");
  }

  void info({required String message, required String name}) {
    _log.i(" $message");
  }
}

@Riverpod(keepAlive: true)
AppLogger appLogger(Ref ref) {
  return AppLogger(ref);
}
