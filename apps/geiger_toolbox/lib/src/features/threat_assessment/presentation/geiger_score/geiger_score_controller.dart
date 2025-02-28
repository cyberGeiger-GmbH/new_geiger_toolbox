import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/geiger_score_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'geiger_score_controller.g.dart';

@riverpod
class GeigerScoreController extends _$GeigerScoreController {
  @override
  FutureOr<void> build() async {
    _log.i("initializing geiger score controller");
    return;
  }

  Logger get _log => ref.read(logHandlerProvider("GeigerScoreScoreController"));

  Future<void> calculateGeigerScore() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(geigerScoreServiceProvider).cachedGeigerScore());
  }

  final bool _success = false;

  bool success() => _success;

  void onScanComplete({required AsyncValue<void> scanPressState}) async {
    if (!scanPressState.isLoading && !scanPressState.hasError) {
      _log.i("Recalculating geiger score...");
      await calculateGeigerScore();
      _log.i("finished recalculating geiger score");
    }
  }
}

@riverpod
class ScoreError extends _$ScoreError {
  @override
  bool build() {
    return false;
  }

  void _setError(bool value) {
    state = value;
  }

  void onCalculateError({required AsyncValue<void> calculateState}) {
    _setError(calculateState.hasError && !calculateState.isLoading);
  }
}
