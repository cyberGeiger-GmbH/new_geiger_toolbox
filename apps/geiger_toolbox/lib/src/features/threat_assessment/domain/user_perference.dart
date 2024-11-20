import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_perference.freezed.dart';

@freezed
class UserPerference with _$UserPerference {
  const factory UserPerference(
      {@Default(false) final bool termsAndConditions,
      @Default(false) final bool initialScan}) = _UserPerference;
}
