// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      platform: json['platform'] as String,
      smeCategory: json['smeCategory'] as String,
      locale: json['locale'] as String? ?? "en",
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'smeCategory': instance.smeCategory,
      'locale': instance.locale,
    };
