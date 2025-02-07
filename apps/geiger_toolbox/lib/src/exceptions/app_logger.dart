import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
part 'app_logger.g.dart';

class AppLogger {
  AppLogger(this.ref);

  final Ref ref;
  FutureOr<void> logError(Object error, StackTrace? stackTrace) async {
    final log = ref.read(logHandlerProvider("AppLogger "));
    await Sentry.captureException(error, stackTrace: stackTrace);
    log.e(' $error, $stackTrace');
  }

  FutureOr<void> logAppException(AppException exception) async {
    final log = ref.read(logHandlerProvider("Debug:"));

    await Sentry.captureException(exception);
    log.e("$exception");
  }

  void info({required String message, required String name}) {
    final log = ref.read(logHandlerProvider(name));
    log.i(
      " $message",
    );
  }
}

@Riverpod(keepAlive: true)
AppLogger appLogger(Ref ref) {
  return AppLogger(ref);
}
