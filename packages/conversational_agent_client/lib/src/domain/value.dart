import 'package:freezed_annotation/freezed_annotation.dart';
part 'value.freezed.dart';
part 'value.g.dart';

@freezed
class Value with _$Value {
  const factory Value({required final String message}) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}
