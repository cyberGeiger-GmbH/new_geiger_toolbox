import 'package:freezed_annotation/freezed_annotation.dart';
part 'company.freezed.dart';

@freezed
class Company with _$Company {
  factory Company({required String companyName, required String location, required String description}) = _Company;
}
