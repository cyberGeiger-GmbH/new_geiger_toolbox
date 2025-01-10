import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User(
      {required final String companyName,
      required final String location,
      required final String description}) = _User;
}

@freezed
class UserData with _$UserData {
  factory UserData({required final int id, required final User user}) =
      _UserData;
}
