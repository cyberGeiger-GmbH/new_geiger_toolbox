import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_client.dart';

class LoggerAnalyticsClient implements AnalyticsClient {
  const LoggerAnalyticsClient(this.ref);
  final Ref ref;
  static const _name = 'Event';

  AppLogger get _log => ref.read(appLoggerProvider);
  @override
  Future<void> trackScanWithProfile() async {
    _log.info(
      message: "trackScanWithProfile",
      name: _name,
    );
  }

  @override
  Future<void> trackScanWithoutProfile() async {
    _log.info(message: "trackScanWithoutProfile", name: _name);
  }

  @override
  Future<void> trackTodoCompleted(int completedCount) async {
    _log.info(message: "trackTodoCompleted: $completedCount", name: _name);
  }

  @override
  Future<void> trackTodosCreated() async {
    _log.info(message: "trackTodosCreated", name: _name);
  }

  @override
  Future<void> trackTodosUpdated() async {
    _log.info(message: "trackTodosUpdated", name: _name);
  }

  @override
  Future<void> trackScreenView(
    String routeName,
    String action,
  ) async {
    _log.info(
        message: "trackScreenView($routeName, $action)", name: "Navigation");
  }

  @override
  Future<void> setAnalyticsCollectionEnabled(bool enable) async {
    _log.info(message: "setAnalyticsCollectionEnabled($enable)", name: _name);
  }
}
