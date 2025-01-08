import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logging_handler.g.dart';

class LoggingHandler extends LogPrinter {
  final String className;
  LoggingHandler._(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.defaultLevelColors[event.level];
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    var a = (color!("$className => $emoji ${event.message}"));

    return [a];
  }
}

@riverpod
Logger loggingHandler(Ref ref, String source) {
  return Logger(printer: LoggingHandler._(source));
}
