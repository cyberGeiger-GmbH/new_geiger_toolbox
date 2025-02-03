// ignore_for_file: prefer-match-file-name, avoid-non-null-assertion

import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_handling.g.dart';

class LogHandling extends LogPrinter {
  final String className;
  final String packageName;
  LogHandling._(this.className, {required this.packageName});

  factory LogHandling.withPackageName(
      {required String packageName, required String className}) {
    return LogHandling._("", packageName: packageName);
  }

  factory LogHandling.withDefaultPackageName({required String className}) {
    return LogHandling._(className, packageName: "Toolbox");
  }

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.defaultLevelColors[event.level];
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    var a = (color!("$packageName [$className] : $emoji ${event.message}"));

    return [a];
  }
}

@riverpod
Logger logHandler(Ref ref, String source, {String? packageName}) {
  return packageName != null
      ? Logger(
          printer: LogHandling.withPackageName(
              packageName: packageName, className: source))
      : Logger(
          printer: LogHandling.withDefaultPackageName(className: source));
 
}
