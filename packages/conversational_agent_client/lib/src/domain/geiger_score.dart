import 'package:freezed_annotation/freezed_annotation.dart';
part 'geiger_score.freezed.dart';
part 'geiger_score.g.dart';

@freezed
class GeigerScore with _$GeigerScore {
  const factory GeigerScore({required int geigerScore, required String reasons, required String interpretation}) =
      _GeigerScore;

  factory GeigerScore.fromJson(Map<String, Object?> json) => _$GeigerScoreFromJson(json);
}
