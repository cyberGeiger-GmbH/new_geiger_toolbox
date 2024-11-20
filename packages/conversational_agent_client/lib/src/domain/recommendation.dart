import 'package:freezed_annotation/freezed_annotation.dart';

import 'offering.dart';
part 'recommendation.freezed.dart';
part 'recommendation.g.dart';

@freezed
class Recommendation with _$Recommendation {
  factory Recommendation(
      {required final String id,
      required String name,
      @JsonKey(name: "specific_offerings")
      required List<Offering> offerings}) = _Recommendation;

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}
