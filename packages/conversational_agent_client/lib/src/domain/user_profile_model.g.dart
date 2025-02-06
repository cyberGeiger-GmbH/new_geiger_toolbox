// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      currentUserProfile:
          Profile.fromJson(json['currentUserProfile'] as Map<String, dynamic>),
      previousUserProfile: json['previousUserProfile'] == null
          ? null
          : Profile.fromJson(
              json['previousUserProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'currentUserProfile': instance.currentUserProfile,
      'previousUserProfile': instance.previousUserProfile,
    };

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      actor: Actor.fromJson(json['actor'] as Map<String, dynamic>),
      news: (json['news'] as List<dynamic>)
          .map((e) => NewsActicle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actor': instance.actor,
      'news': instance.news,
    };

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
      companyName: json['companyName'] as String?,
      location: json['location'] as String?,
      companyDescription: json['companyDescription'] as String?,
      userDevice: Asset.fromJson(json['userDevice'] as Map<String, dynamic>),
      score: json['score'] as String?,
      locale: json['locale'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'location': instance.location,
      'companyDescription': instance.companyDescription,
      'userDevice': instance.userDevice,
      'score': instance.score,
      'locale': instance.locale,
      'assets': instance.assets,
    };

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      type: json['type'] as String,
      version: json['version'] as String,
      model: json['model'] as String,
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'version': instance.version,
      'model': instance.model,
    };

_$DefinitionImpl _$$DefinitionImplFromJson(Map<String, dynamic> json) =>
    _$DefinitionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      protection: (json['protection'] as List<dynamic>)
          .map((e) => Protection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DefinitionImplToJson(_$DefinitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'protection': instance.protection,
    };

_$ProtectionImpl _$$ProtectionImplFromJson(Map<String, dynamic> json) =>
    _$ProtectionImpl(
      name: json['name'] as String,
      summary: json['summary'] as String,
      status: $enumDecode(_$ProtectionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$ProtectionImplToJson(_$ProtectionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'summary': instance.summary,
      'status': _$ProtectionStatusEnumMap[instance.status]!,
    };

const _$ProtectionStatusEnumMap = {
  ProtectionStatus.recommended: 'recommended',
  ProtectionStatus.planned: 'planned',
  ProtectionStatus.done: 'done',
};
