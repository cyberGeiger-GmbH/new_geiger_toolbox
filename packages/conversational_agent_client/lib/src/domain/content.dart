import 'package:conversational_agent_client/src/domain/text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Content with _$Content {
  const factory Content(
      {required final String type, required final Text text}) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
