import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_id.freezed.dart';
part 'user_id.g.dart';

@freezed
class UserID with _$UserID {
  const factory UserID({required final String userID, @Default("toolbox") final String? origin}) = _UserID;

  factory UserID.fromJson(Map<String, dynamic> json) => _$UserIDFromJson(json);
}
