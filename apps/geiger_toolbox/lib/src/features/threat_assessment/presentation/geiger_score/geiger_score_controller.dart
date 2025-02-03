import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/geiger_score_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'geiger_score_controller.g.dart';

@riverpod
class GeigerScoreController extends _$GeigerScoreController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Logger get _log => ref.read(logHandlerProvider("GeigerScoreScoreController"));

  Future<void> _calculateGeigerScore() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(geigerScoreServiceProvider).cachedGeigerScore());
  }

  void onScanComplete({required AsyncValue<void> scanPressState}) async {
    if (!scanPressState.isLoading && !scanPressState.hasError) {
      _log.i("Recalculating geiger score...");
      await _calculateGeigerScore();
      _log.i("finished recalculating geiger score");
    }
  }
}
