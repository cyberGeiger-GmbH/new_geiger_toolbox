import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/env.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_client.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mixpanel_analytics_client.g.dart';

class MixpanelAnalyticsClient implements AnalyticsClient {
  const MixpanelAnalyticsClient(this._mixpanel);
  final Mixpanel _mixpanel;

  @override
  Future<void> setAnalyticsCollectionEnabled(bool enable) async {
    if (enable) {
      _mixpanel.optInTracking();
    } else {
      _mixpanel.optOutTracking();
    }
  }

  @override
  Future<void> trackScanWithProfile() async {
    await _mixpanel.track('Scan with Profile');
  }

  @override
  Future<void> trackScanWithoutProfile() async {
    await _mixpanel.track('Scan without Profile');
  }

  @override
  Future<void> trackScreenView(String routeName, String action) async {
    await _mixpanel.track("Screen View",
        properties: {'name': routeName, 'actiong': action});
  }

  @override
  Future<void> trackTodoCompleted(int completedCount) async {
    await _mixpanel
        .track('Todo completed', properties: {'count': completedCount});
  }

  @override
  Future<void> trackTodosCreated() async {
    await _mixpanel.track("Todo created");
  }

  @override
  Future<void> trackTodosUpdated() async {
    await _mixpanel.track("Todo created");
  }
}

@Riverpod(keepAlive: true)
Future<MixpanelAnalyticsClient> mixpanelAnalyticsClient(Ref ref) async {
  final mixpanel = await Mixpanel.init(
    Env.mixpanelProjectToken,
    trackAutomaticEvents: true,
  );
  return MixpanelAnalyticsClient(mixpanel);
}
