// ignore_for_file: prefer-match-file-name, avoid-non-null-assertion

import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_handling.g.dart';

class _LogHandling extends LogPrinter {
  final String className;
  _LogHandling(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.defaultLevelColors[event.level];
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    var a = (color!("$className => $emoji ${event.message}"));

    return [a];
  }
}

@riverpod
Logger logHandler(Ref ref, String source) {
  return Logger(printer: _LogHandling(source));
}
