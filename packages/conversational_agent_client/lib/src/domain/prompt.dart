import 'package:conversational_agent_client/src/domain/user_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt.freezed.dart';
part 'prompt.g.dart';

@freezed
class Prompt with _$Prompt {
  const factory Prompt(
      {required final UserID userID,
      required final String userMessage,
      @Default("toolboxMicroskill") String? assistantName}) = _Prompt;

  factory Prompt.fromJson(Map<String, dynamic> json) => _$PromptFromJson(json);
}
