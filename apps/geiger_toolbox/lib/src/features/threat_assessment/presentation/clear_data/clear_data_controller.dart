import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'clear_data_controller.g.dart';

@riverpod
class CleanDataController extends _$CleanDataController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> deleteNewsData() async {
    state = const AsyncLoading();
    final data = ref.read(watchRecentNewsFeedsProvider);
    state = await AsyncValue.guard(() {
      data.valueOrNull!.clear();
      return ref.read(newsFeedServiceProvider).cleanNewsCache();
    });
  }
}
