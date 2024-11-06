import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_not_found.freezed.dart';
part 'user_not_found.g.dart';

@freezed
class UserNotFound with _$UserNotFound {
  const UserNotFound._();

  const factory UserNotFound({required final String error}) = _UserNotFound;

  factory UserNotFound.fromJson(Map<String, dynamic> json) =>
      _$UserNotFoundFromJson(json);
}
