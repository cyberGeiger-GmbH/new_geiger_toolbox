// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      locale: json['locale'] as String? ?? "en",
      location: json['location'] as String,
      digitalInfrastructure: DigitalInfrastructure.fromJson(
          json['digitalInfrastructure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'location': instance.location,
      'digitalInfrastructure': instance.digitalInfrastructure,
    };

_$DigitalInfrastructureImpl _$$DigitalInfrastructureImplFromJson(
        Map<String, dynamic> json) =>
    _$DigitalInfrastructureImpl(
      infoAbout:
          (json['infoAbout'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DigitalInfrastructureImplToJson(
        _$DigitalInfrastructureImpl instance) =>
    <String, dynamic>{
      'infoAbout': instance.infoAbout,
    };
