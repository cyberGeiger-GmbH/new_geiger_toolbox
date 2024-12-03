// ignore_for_file: prefer-match-file-name, avoid-non-null-assertion

import 'package:logger/logger.dart';

Logger logger({required String className}) =>
    Logger(printer: _LogHandling(className));

class _LogHandling extends LogPrinter {
  final String className;
  _LogHandling(this.className);
  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.defaultLevelColors[event.level];
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    var a = (color!(
        "conversational_agent_client => $className => $emoji ${event.message}"));
        
    return [a];
  }
}
