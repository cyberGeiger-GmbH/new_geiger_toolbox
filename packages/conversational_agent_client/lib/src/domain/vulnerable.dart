import 'package:freezed_annotation/freezed_annotation.dart';
part 'vulnerable.freezed.dart';
part 'vulnerable.g.dart';

@freezed
class Vulnerable with _$Vulnerable {
  factory Vulnerable({required String name, required String effect}) =
      _Vulnerable;

  factory Vulnerable.fromJson(Map<String, dynamic> json) =>
      _$VulnerableFromJson(json);
}
