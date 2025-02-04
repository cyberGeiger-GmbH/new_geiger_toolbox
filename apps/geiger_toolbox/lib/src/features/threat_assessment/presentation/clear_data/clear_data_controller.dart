import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_news_feed_repository.dart';

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
    state = await AsyncValue.guard(() async {
      data.valueOrNull!.clear();
      ref.read(newsFeedCacheRepositoryProvider).deleteNews();
      ref.read(localGeigerScoreRepoProvider).deleteScoreData();
    });
  }
}
