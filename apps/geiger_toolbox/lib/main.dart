import 'dart:async';

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/env.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/exceptions/async_error_logger.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/feedback_widget.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/geiger_app.dart';
import 'src/exceptions/app_logger.dart';

Future<void> runMainApp({FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();


  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown, // optional
  ]);

  //sentry error monitoring
  await SentryFlutter.init((options) {
    options.dsn = Env.sentryDsn;
    options.environment = getFlavor().name;
    options
      ..considerInAppFramesByDefault = false
      ..addInAppInclude('geiger_toolbox')
      ..addInAppInclude('core_ui')
      ..addInAppInclude('conversational_agent_client')
      ..addInAppInclude('perplexity_search');

    options.beforeSend = (SentryEvent event, Hint hint) async {
      // Ignore events that are not from release builds
      if (!kReleaseMode) {
        return null;
      }
      // If there was no response, it means that a connection error occurred
      // Do not log this to Sentry
      final exception = event.throwable;
      if (exception is DioException && exception.response == null) {
        return null;
      }
      // For all other events, return the event as is
      return event;
    };
  });

  // initialize firebase
  await Firebase.initializeApp(options: firebaseOptions);

  // * riverpod container for observing container errors [ AsyncErrorLogger] and overriding default storage
  final container = ProviderContainer(observers: [AsyncErrorLogger()]);

  //* Register error handler.For more info, see:
  // * https://docs.flutter.dev/testing/errors
  final errorLogger = container.read(appLoggerProvider);
  registerErroHandlers(errorLogger);

  // * run app
  runApp(UncontrolledProviderScope(container: container, child: FeedbackWidget.wrapWidget(child: const GeigerApp())));
}

void registerErroHandlers(AppLogger errorLogger) {
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
      appBar: AppBar(backgroundColor: Colors.red, title: Text("An error occurred".hardcoded)),
      body: ErrorMessage(message: "$details"),
    );
  };
}
