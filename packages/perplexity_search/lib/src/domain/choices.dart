import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:perplexity_search/src/domain/choice.dart';
part 'choices.freezed.dart';
part 'choices.g.dart';

@freezed
class Choices with _$Choices {
  const factory Choices(
      {required final List<String> citations,
      required final List<Choice> choices}) = _Choices;

  factory Choices.fromJson(Map<String, dynamic> json) =>
      _$ChoicesFromJson(json);
}
