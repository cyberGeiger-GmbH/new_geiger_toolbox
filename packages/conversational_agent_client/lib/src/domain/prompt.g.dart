// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptImpl _$$PromptImplFromJson(Map<String, dynamic> json) => _$PromptImpl(
      userId: UserID.fromJson(json['userId'] as Map<String, dynamic>),
      userMessage: json['userMessage'] as String,
      assistantName: json['assistantName'] as String? ?? "toolboxMicroskill",
    );

Map<String, dynamic> _$$PromptImplToJson(_$PromptImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userMessage': instance.userMessage,
      'assistantName': instance.assistantName,
    };
