// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChoicesImpl _$$ChoicesImplFromJson(Map<String, dynamic> json) => _$ChoicesImpl(
  citations: (json['citations'] as List<dynamic>).map((e) => e as String).toList(),
  choices: (json['choices'] as List<dynamic>).map((e) => Choice.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$$ChoicesImplToJson(_$ChoicesImpl instance) => <String, dynamic>{
  'citations': instance.citations,
  'choices': instance.choices,
};
