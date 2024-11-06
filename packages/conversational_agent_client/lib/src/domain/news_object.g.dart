// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsObjectImpl _$$NewsObjectImplFromJson(Map<String, dynamic> json) =>
    _$NewsObjectImpl(
      news: (json['news'] as List<dynamic>)
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsObjectImplToJson(_$NewsObjectImpl instance) =>
    <String, dynamic>{
      'news': instance.news,
    };
