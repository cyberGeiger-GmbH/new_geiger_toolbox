// ignore_for_file: no-empty-block

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_feeds_controller.g.dart';

@riverpod
class NewsFeedsController extends _$NewsFeedsController {
  @override
  int build() {
    return 0;
  }

  void update(int value) {
    state = value;
  }
}
