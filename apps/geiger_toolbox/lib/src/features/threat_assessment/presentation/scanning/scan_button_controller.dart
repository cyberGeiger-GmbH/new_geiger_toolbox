import 'dart:async';

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
    unawaited(
      (ref.read(analyticsFacadeProvider).trackScanWithoutProfile()),
    );
  }

  Future<void> deleteData() async {
    state = const AsyncLoading();
    final data = ref.read(watchNewsFeedsProvider);
    state = await AsyncValue.guard(() {
      data.valueOrNull!.clear();
      return ref.read(newsFeedServiceProvider).cleanNewsCache();
    });
  }
}
