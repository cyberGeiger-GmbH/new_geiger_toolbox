import 'package:freezed_annotation/freezed_annotation.dart';
part 'geiger_score_info.freezed.dart';

@freezed
class GeigerScoreInfo with _$GeigerScoreInfo {
  const factory GeigerScoreInfo(
      {required int id,
      required int geigerScore,
      required DateTime lastUpdate,
      required String status,
      required String reason}) = _GeigerScoreInfo;
}
