import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/error_logger.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_client.dart';

class LoggerAnalyticsClient implements AnalyticsClient {
  const LoggerAnalyticsClient(this.ref);
  final Ref ref;
  static const _name = 'Event';

  @override
  Future<void> trackScanWithProfile() async {
    final log = ref.read(errorLoggerProvider);
    log.info(
      message: "trackScanWithProfile",
      name: _name,
    );
  }

  @override
  Future<void> trackScanWithoutProfile() async {
    final log = ref.read(errorLoggerProvider);
    log.info(message: "trackScanWithoutProfile", name: _name);
  }

  @override
  Future<void> trackTodoCompleted(int completedCount) async {
    final log = ref.read(errorLoggerProvider);
    log.info(message: "trackTodoCompleted: $completedCount", name: _name);
  }

  @override
  Future<void> trackTodosCreated() async {
    final log = ref.read(errorLoggerProvider);
    log.info(message: "trackTodosCreated", name: _name);
  }

  @override
  Future<void> trackTodosUpdated() async {
    final log = ref.read(errorLoggerProvider);
    log.info(message: "trackTodosUpdated", name: _name);
  }

  @override
  Future<void> trackScreenView(
    String routeName,
    String action,
  ) async {
    final log = ref.read(errorLoggerProvider);
    log.info(
        message: "trackScreenView($routeName, $action)", name: "Navigation");
  }
}
