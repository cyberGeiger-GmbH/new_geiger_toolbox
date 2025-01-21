import 'package:freezed_annotation/freezed_annotation.dart';
part 'geiger_score_info.freezed.dart';

@freezed
class GeigerScoreInfo with _$GeigerScoreInfo {
  const factory GeigerScoreInfo(
      {required int id,
      required int geigerScore,
      required DateTime lastUpdate,
      required List<ScoreReason> reasons}) = _GeigerScoreInfo;
}

@freezed
class ScoreReason with _$ScoreReason {
  const factory ScoreReason({required int scoreId, required String name}) =
      _ScoreReason;
}
