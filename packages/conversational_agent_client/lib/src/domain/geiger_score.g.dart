// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geiger_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeigerScoreImpl _$$GeigerScoreImplFromJson(Map<String, dynamic> json) => _$GeigerScoreImpl(
  geigerScore: (json['geigerScore'] as num).toInt(),
  reasons: json['reasons'] as String,
  interpretation: json['interpretation'] as String,
);

Map<String, dynamic> _$$GeigerScoreImplToJson(_$GeigerScoreImpl instance) => <String, dynamic>{
  'geigerScore': instance.geigerScore,
  'reasons': instance.reasons,
  'interpretation': instance.interpretation,
};
