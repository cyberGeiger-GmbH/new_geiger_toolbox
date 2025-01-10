// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      locale: json['locale'] as String? ?? "en",
      location: json['location'] as String,
      companyName: json['companyName'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'location': instance.location,
      'companyName': instance.companyName,
      'description': instance.description,
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
