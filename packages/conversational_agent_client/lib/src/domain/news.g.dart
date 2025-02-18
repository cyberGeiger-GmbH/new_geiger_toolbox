// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String,
  newsCategory: json['news_category'] as String,
  articleUrl: json['article_url'] as String,
  imageUrl: json['image_url'] as String,
  dateCreated: json['date_created'] as String,
  recommendations:
      (json['recommendations'] as List<dynamic>)
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'news_category': instance.newsCategory,
  'article_url': instance.articleUrl,
  'image_url': instance.imageUrl,
  'date_created': instance.dateCreated,
  'recommendations': instance.recommendations,
};
