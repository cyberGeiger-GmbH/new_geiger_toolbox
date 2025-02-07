import 'package:freezed_annotation/freezed_annotation.dart';

part 'offering.freezed.dart';
part 'offering.g.dart';

@freezed
class Offering with _$Offering {
  factory Offering({
    required String name,
    required String summary,
  }) = _Offering;

  factory Offering.fromJson(Map<String, dynamic> json) =>
      _$OfferingFromJson(json);
}
