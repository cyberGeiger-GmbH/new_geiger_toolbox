import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart'; // Mandatory
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    @Default("en") final String? locale,
    required final String location,
    required final String companyName,
    final String? description,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class DigitalInfrastructure with _$DigitalInfrastructure {
  const factory DigitalInfrastructure({
    required List<String> infoAbout,
  }) = _DigitalInfrastructure;

  factory DigitalInfrastructure.fromJson(Map<String, dynamic> json) =>
      _$DigitalInfrastructureFromJson(json);
}
