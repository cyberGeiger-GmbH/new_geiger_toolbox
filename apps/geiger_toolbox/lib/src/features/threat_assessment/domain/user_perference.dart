import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
part 'user_perference.freezed.dart';
part 'user_perference.g.dart';

@freezed
@HiveType(typeId: 1)
class UserPerference with _$UserPerference {
  const factory UserPerference(
      {@HiveField(0) @Default(false) final bool termsAndConditions,
      @HiveField(1) @Default(false) final bool initialScan}) = _UserPerference;
}
