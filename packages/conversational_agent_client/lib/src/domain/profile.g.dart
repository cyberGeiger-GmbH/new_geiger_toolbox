// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      actor: json['actor'] == null
          ? null
          : Actor.fromJson(json['actor'] as Map<String, dynamic>),
      verb: Verb.fromJson(json['verb'] as Map<String, dynamic>),
      object: json['object'] == null
          ? null
          : ActingObject.fromJson(json['object'] as Map<String, dynamic>),
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actor': instance.actor,
      'verb': instance.verb,
      'object': instance.object,
      'result': instance.result,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
      companyName: json['companyName'] as String?,
      location: json['location'] as String?,
      userDevice: Asset.fromJson(json['userDevice'] as Map<String, dynamic>),
      locale: json['locale'] as String? ?? "en",
      companyDescription: json['companyDescription'] as String?,
      smeOwner: json['smeOwner'] as bool? ?? true,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'location': instance.location,
      'userDevice': instance.userDevice,
      'locale': instance.locale,
      'companyDescription': instance.companyDescription,
      'smeOwner': instance.smeOwner,
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

_$VerbImpl _$$VerbImplFromJson(Map<String, dynamic> json) => _$VerbImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$VerbImplToJson(_$VerbImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$ActingObjectImpl _$$ActingObjectImplFromJson(Map<String, dynamic> json) =>
    _$ActingObjectImpl(
      definition: (json['definition'] as List<dynamic>)
          .map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ActingObjectImplToJson(_$ActingObjectImpl instance) =>
    <String, dynamic>{
      'definition': instance.definition,
    };

_$DefinitionImpl _$$DefinitionImplFromJson(Map<String, dynamic> json) =>
    _$DefinitionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      extensions: (json['extensions'] as List<dynamic>)
          .map((e) => DefinitionExtension.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DefinitionImplToJson(_$DefinitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'extensions': instance.extensions,
    };

_$DefinitionExtensionImpl _$$DefinitionExtensionImplFromJson(
        Map<String, dynamic> json) =>
    _$DefinitionExtensionImpl(
      recommendationType: json['recommendationType'] as String,
      id: json['id'] as String,
      implementations: (json['implementations'] as List<dynamic>)
          .map((e) => Implementation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DefinitionExtensionImplToJson(
        _$DefinitionExtensionImpl instance) =>
    <String, dynamic>{
      'recommendationType': instance.recommendationType,
      'id': instance.id,
      'implementations': instance.implementations,
    };

_$ImplementationImpl _$$ImplementationImplFromJson(Map<String, dynamic> json) =>
    _$ImplementationImpl(
      name: json['name'] as String,
      summary: json['summary'] as String,
      planned: json['planned'] as bool,
      firstPlanned: json['firstPlanned'] == null
          ? null
          : DateTime.parse(json['firstPlanned'] as String),
    );

Map<String, dynamic> _$$ImplementationImplToJson(
        _$ImplementationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'summary': instance.summary,
      'planned': instance.planned,
      'firstPlanned': instance.firstPlanned?.toIso8601String(),
    };

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      id: (json['id'] as num).toInt(),
      success: json['success'] as bool,
      completions: json['completions'] as bool,
      extensions:
          ResultExtensions.fromJson(json['extensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'success': instance.success,
      'completions': instance.completions,
      'extensions': instance.extensions,
    };

_$ResultExtensionsImpl _$$ResultExtensionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResultExtensionsImpl(
      geigerScore: (json['geigerScore'] as num).toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      reasons: json['reasons'] as String,
    );

Map<String, dynamic> _$$ResultExtensionsImplToJson(
        _$ResultExtensionsImpl instance) =>
    <String, dynamic>{
      'geigerScore': instance.geigerScore,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'reasons': instance.reasons,
    };
