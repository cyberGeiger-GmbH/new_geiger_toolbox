// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendationImpl _$$RecommendationImplFromJson(Map<String, dynamic> json) =>
    _$RecommendationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      rationale: json['rationale'] as String,
      offerings: (json['specific_offerings'] as List<dynamic>)
          .map((e) => Offering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecommendationImplToJson(
        _$RecommendationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rationale': instance.rationale,
      'specific_offerings': instance.offerings,
    };
