import 'dart:async';

import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_facade.dart';
import 'package:geiger_toolbox/src/utils/shared_preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'collect_usage_statistics_store.g.dart';

@riverpod
class CollectUsageStatisticsStore extends _$CollectUsageStatisticsStore {
  static const key = 'collect_usage_statistics';

  SharedPreferences get _sharedPreferences => ref.watch(sharedPreferencesProvider).requireValue;

  AnalyticsFacade get _analyticsFacade => ref.watch(analyticsFacadeProvider);

  @override
  bool build() {
    //disable analytics in prod
    if (getFlavor() == Flavor.prod) {
      return _sharedPreferences.getBool(key) ?? false;
    } else {
      return _sharedPreferences.getBool(key) ?? true;
    }
  }

  Future<void> setCollectUsageStatistics(bool value) async {
    // unawaited
    await _sharedPreferences.setBool(key, value);
    // invalidate to ensure listeners rebuild when the value changes
    ref.invalidateSelf();
    unawaited(_analyticsFacade.setAnalyticsCollectionEnabled(value));
  }
}
