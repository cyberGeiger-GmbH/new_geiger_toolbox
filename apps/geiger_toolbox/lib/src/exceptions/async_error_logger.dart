import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';

///Error logger class to keep track of all AsyncError states
///that are set by the controllers in the app
class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final errorLogger = container.read(appLoggerProvider);
    final error = _findError(newValue);
    if (error != null) {
      if (error.error is AppException) {
        //only prints the AppException data
        errorLogger.logAppException(error.error as AppException);
      } else {
        //print everything including the stack trace
        errorLogger.logError(error.error, error.stackTrace);
      }
    }
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  //ensure the object is an AsyncError
  // ignore: avoid-dynamic
  AsyncError<dynamic>? _findError(Object? value) {
    return value is AsyncError ? value : null;
  }
}
