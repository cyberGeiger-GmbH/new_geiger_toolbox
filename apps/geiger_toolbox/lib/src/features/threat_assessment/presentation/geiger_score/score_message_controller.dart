import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'score_message_controller.g.dart';

@riverpod
class ScoreControllerMessage extends _$ScoreControllerMessage {
  @override
  bool build() {
    return false;
  }

  void dismissableMessage(bool value) {
    state = value;
  }
}
