import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
part 'error_logger.g.dart';

class ErrorLogger {
  ErrorLogger(this.ref);

  final Ref ref;
  FutureOr<void> logError(Object error, StackTrace? stackTrace) async {
    final log = ref.read(logHandlerProvider("Debug: "));
    await Sentry.captureException(error, stackTrace: stackTrace);
    log.d(' $error, $stackTrace');
  }

  FutureOr<void> logAppException(AppException exception) async {
    final log = ref.read(logHandlerProvider("Debug:"));

    await Sentry.captureException(exception);
    log.d("$exception");
  }

  void info({required String message, required String name}) {
    final log = ref.read(logHandlerProvider(name));
    log.i(
      " $message",
    );
  }
}

@Riverpod(keepAlive: true)
ErrorLogger errorLogger(Ref ref) {
  return ErrorLogger(ref);
}
