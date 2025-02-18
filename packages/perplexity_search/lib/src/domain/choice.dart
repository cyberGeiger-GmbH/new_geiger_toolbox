import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perplexity_search/src/domain/message.dart';
part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
class Choice with _$Choice {
  const factory Choice({required Message message}) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}
