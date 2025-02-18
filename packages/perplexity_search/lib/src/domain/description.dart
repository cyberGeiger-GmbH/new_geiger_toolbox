import 'package:freezed_annotation/freezed_annotation.dart';
part 'description.freezed.dart';

@freezed
class Description with _$Description {
  const factory Description({required final List<String> references, required final String description}) = _Description;
}
