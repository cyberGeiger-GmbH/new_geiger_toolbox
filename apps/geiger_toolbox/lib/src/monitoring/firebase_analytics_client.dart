import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_analytics_client.g.dart';

class FirebaseAnalyticsClient implements AnalyticsClient {
  const FirebaseAnalyticsClient(this._analytics);
  final FirebaseAnalytics _analytics;

  @override
  Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    await _analytics.setAnalyticsCollectionEnabled(enabled);
  }

  @override
  Future<void> trackScanWithProfile() async {
    await _analytics.logEvent(name: 'scan_with_profile');
  }

  @override
  Future<void> trackScanWithoutProfile() async {
    await _analytics.logEvent(name: 'scan_without_profile');
  }

  @override
  Future<void> trackScreenView(String routeName, String action) async {
    await _analytics.logScreenView(screenName: "screen_view", parameters: {'name': routeName, 'action': action});
  }

  @override
  Future<void> trackTodoCompleted(int completedCount) async {
    await _analytics.logEvent(name: 'Todo completed', parameters: {'count': completedCount});
  }

  @override
  Future<void> trackTodosCreated() async {
    await _analytics.logEvent(name: "todo_created");
  }

  @override
  Future<void> trackTodosUpdated() async {
    await _analytics.logEvent(name: "todo_updated");
  }
}

@Riverpod(keepAlive: true)
FirebaseAnalyticsClient firebaseAnalyticsClient(Ref ref) {
  return FirebaseAnalyticsClient(FirebaseAnalytics.instance);
}
