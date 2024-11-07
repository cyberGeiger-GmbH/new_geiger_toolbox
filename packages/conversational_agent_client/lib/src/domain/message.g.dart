// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      message: json['message'] as String,
      id: json['id'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role],
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.assistant: 'assistant',
};
