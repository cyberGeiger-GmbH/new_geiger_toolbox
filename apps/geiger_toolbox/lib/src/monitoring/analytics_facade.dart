import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_client.dart';
import 'package:geiger_toolbox/src/monitoring/firebase_analytics_client.dart';
import 'package:geiger_toolbox/src/monitoring/logger_analytics_client.dart';
import 'package:geiger_toolbox/src/monitoring/mixpanel_analytics_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_facade.g.dart';

class AnalyticsFacade implements AnalyticsClient {
  const AnalyticsFacade(this.clients);
  final List<AnalyticsClient> clients;

  @override
  Future<void> trackScanWithProfile() =>
      _dispatch((c) => c.trackScanWithProfile());

  @override
  Future<void> trackScanWithoutProfile() =>
      _dispatch((c) => c.trackScanWithoutProfile());

  @override
  Future<void> trackTodoCompleted(int completedCount) =>
      _dispatch((c) => c.trackTodoCompleted(completedCount));

  @override
  Future<void> trackTodosCreated() => _dispatch((c) => c.trackTodosCreated());

  @override
  Future<void> trackTodosUpdated() => _dispatch((c) => c.trackTodosUpdated());

  @override
  Future<void> trackScreenView(
    String routeName,
    String action,
  ) =>
      _dispatch((c) => c.trackScreenView(routeName, action));

  @override
  Future<void> setAnalyticsCollectionEnabled(bool enable) =>
      _dispatch((c) => c.setAnalyticsCollectionEnabled(enable));

  Future<void> _dispatch(
      Future<void> Function(AnalyticsClient client) work) async {
    for (var client in clients) {
      await work(client);
    }
  }
}

@Riverpod(keepAlive: true)
AnalyticsFacade analyticsFacade(Ref ref) {
  final mixpanelAnalyticsClient =
      ref.watch(mixpanelAnalyticsClientProvider).requireValue;
  final firebaseAnalyticsClient = ref.watch(firebaseAnalyticsClientProvider);

  return AnalyticsFacade(
    [
      if (kReleaseMode) mixpanelAnalyticsClient,
      if (kReleaseMode) firebaseAnalyticsClient,
      if (!kReleaseMode) LoggerAnalyticsClient(ref),
    ],
  );
}
