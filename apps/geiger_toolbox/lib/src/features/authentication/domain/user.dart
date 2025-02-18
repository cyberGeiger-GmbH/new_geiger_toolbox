import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

//* offeringId is the with hypen separated name of [Offering] name
typedef UserID = String;

@freezed
class User with _$User {
  factory User({
    required final String userId,
    final String? name,
    final String? email,
    required bool owner,
    final DateTime? createdAt,
  }) = _User;
}
