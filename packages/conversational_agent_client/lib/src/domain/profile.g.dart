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
          : Acting.fromJson(json['object'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
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

_$ActingImpl _$$ActingImplFromJson(Map<String, dynamic> json) => _$ActingImpl(
      definition:
          Definition.fromJson(json['definition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActingImplToJson(_$ActingImpl instance) =>
    <String, dynamic>{
      'definition': instance.definition,
    };

_$DefinitionImpl _$$DefinitionImplFromJson(Map<String, dynamic> json) =>
    _$DefinitionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      extensions: (json['extensions'] as List<dynamic>)
          .map((e) => DefinitionExtension.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DefinitionImplToJson(_$DefinitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'extensions': instance.extensions,
    };

_$DefinitionExtensionImpl _$$DefinitionExtensionImplFromJson(
        Map<String, dynamic> json) =>
    _$DefinitionExtensionImpl(
      name: json['name'] as String,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$$DefinitionExtensionImplToJson(
        _$DefinitionExtensionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'summary': instance.summary,
    };

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      success: json['success'] as bool,
      completions: json['completions'] as bool,
      extensions:
          ResultExtensions.fromJson(json['extensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'completions': instance.completions,
      'extensions': instance.extensions,
    };

_$ResultExtensionsImpl _$$ResultExtensionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResultExtensionsImpl(
      geigerScore: json['geigerScore'] as String,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      reason:
          (json['reason'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ResultExtensionsImplToJson(
        _$ResultExtensionsImpl instance) =>
    <String, dynamic>{
      'geigerScore': instance.geigerScore,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'reason': instance.reason,
    };
