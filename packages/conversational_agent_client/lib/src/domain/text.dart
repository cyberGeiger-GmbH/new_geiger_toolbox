import 'package:conversational_agent_client/src/domain/value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'text.freezed.dart';
part 'text.g.dart';

@freezed
class Text with _$Text {
  const factory Text({required final Value value}) = _Text;

  factory Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
}
