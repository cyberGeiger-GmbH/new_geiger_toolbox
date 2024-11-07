import 'package:conversational_agent_client/src/domain/content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation(
      {required final String id,
      required final String role,
      @JsonKey(name: "created_at") required int createdAt,
      required final List<Content> content}) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  static List<Conversation> getConversations(List<dynamic> json) {
    return json
        .map<Conversation>((data) => Conversation.fromJson(data))
        .toList();
  }
}
