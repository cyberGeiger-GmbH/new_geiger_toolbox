import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  FutureOr<void> build() {
    //nothing to do
  }

  Future<void> scan() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
        () => ref.read(newsFeedServiceProvider).cacheNews());
  }
}
