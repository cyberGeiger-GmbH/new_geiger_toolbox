import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum Role {
  user("user"),
  assistant("assistant");

  const Role(this.value);

  final String value;
}

@freezed
class Message with _$Message {
  const factory Message(
      {required final String message,
      final String? id,
      final Role? role,
      @JsonKey(name: 'created_at') DateTime? createdAt}) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
