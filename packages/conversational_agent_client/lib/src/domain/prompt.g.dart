// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptImpl _$$PromptImplFromJson(Map<String, dynamic> json) => _$PromptImpl(
  userID: json['userID'] as String,
  origin: json['origin'] as String,
  userMessage: json['userMessage'] as String,
  assistantName: json['assistantName'] as String? ?? "toolbox_Microskill",
);

Map<String, dynamic> _$$PromptImplToJson(_$PromptImpl instance) => <String, dynamic>{
  'userID': instance.userID,
  'origin': instance.origin,
  'userMessage': instance.userMessage,
  'assistantName': instance.assistantName,
};
