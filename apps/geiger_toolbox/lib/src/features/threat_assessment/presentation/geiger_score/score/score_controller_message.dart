import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'score_controller_message.g.dart';

@riverpod
class ScoreControllerMessage extends _$ScoreControllerMessage {
  @override
  bool build() {
    return false;
  }

  void dismissableMessage() {
    // invalidate to ensure listeners rebuild when the value changes

    ref.invalidateSelf();
  }

  void showMessage() {
    state = true;
  }
}
