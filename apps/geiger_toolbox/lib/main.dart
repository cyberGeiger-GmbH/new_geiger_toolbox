import 'package:core_ui/core_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/async_error_logger.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

import 'src/geiger_app.dart';
import 'src/exceptions/error_logger.dart';

Future<void> runMainApp({FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase
  await Firebase.initializeApp(options: firebaseOptions);
  //* Register error handler.For more info, see:
  // * https://docs.flutter.dev/testing/errors
  final container = ProviderContainer(observers: [AsyncErrorLogger()]);
  final errorLogger = container.read(errorLoggerProvider);
  registerErroHandlers(errorLogger);
  runApp(UncontrolledProviderScope(
    container: container,
    child: const GeigerApp(),
  ));
}

void registerErroHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };

  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);

    return true;
  };

  //* Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("An error occurred".hardcoded),
      ),
      body: ErrorMessage(errorMessage: "$details"),
    );
  };
}
