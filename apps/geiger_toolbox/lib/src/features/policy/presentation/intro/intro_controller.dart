import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'intro_controller.g.dart';

@riverpod
class IntroController extends _$IntroController {
  @override
  int build() {
    return 0;
  }

  void update(int value) {
    state = value;
  }
}
