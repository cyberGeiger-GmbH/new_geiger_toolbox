import 'dart:async';

import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/geiger_score_service.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_facade.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../applications/news_feed_service.dart';
part 'scan_button_controller.g.dart';

@riverpod
class ScanButtonController extends _$ScanButtonController {
  @override
  // ignore: no-empty-block
  FutureOr<void> build() {
    //nothing to do
  }

  Future<void> scan() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(newsFeedServiceProvider).cacheNews());
    
    
      state = await AsyncValue.guard(
          () => ref.read(geigerScoreServiceProvider).cachedGeigerScore());
    

//analytics
    unawaited(_trackScanning());
  }

  Future<void> _trackScanning() async {
    final compProfile = await ref.read(fetchCompanyProvider.future);

    if (compProfile != null) {
      ref.read(analyticsFacadeProvider).trackScanWithProfile();
    } else {
      ref.read(analyticsFacadeProvider).trackScanWithoutProfile();
    }
  }
}
