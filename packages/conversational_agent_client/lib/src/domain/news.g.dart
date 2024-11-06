// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      date: json['date'] as String,
      imageUrl: json['image_url'] as String,
      vulnerable: (json['vulnerable'] as List<dynamic>)
          .map((e) => Vulnerable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'date': instance.date,
      'image_url': instance.imageUrl,
      'vulnerable': instance.vulnerable,
    };
