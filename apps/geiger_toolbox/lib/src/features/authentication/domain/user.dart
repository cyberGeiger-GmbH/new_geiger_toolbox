import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User(
      {required int id,
      required final String companyName,
      required final String location}) = _User;
}
