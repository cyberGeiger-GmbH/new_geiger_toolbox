import 'dart:async';

import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
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

//analytics
    unawaited(_trackScanning());
  }

  Future<void> _trackScanning() async {
    final userProfile = await ref.read(fetchUserProvider.future);

    if (userProfile != null) {
      ref.read(analyticsFacadeProvider).trackScanWithProfile();
    } else {
      ref.read(analyticsFacadeProvider).trackScanWithoutProfile();
    }
  }
}
