// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptImpl _$$PromptImplFromJson(Map<String, dynamic> json) => _$PromptImpl(
      userID: UserID.fromJson(json['userID'] as Map<String, dynamic>),
      userMessage: json['userMessage'] as String,
      assistantName: json['assistantName'] as String? ?? "toolboxMicroskill",
    );

Map<String, dynamic> _$$PromptImplToJson(_$PromptImpl instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'userMessage': instance.userMessage,
      'assistantName': instance.assistantName,
    };
