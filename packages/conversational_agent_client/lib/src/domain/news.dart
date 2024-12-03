// ignore_for_file: avoid-dynamic

library conversational_agent_client;

import 'dart:convert';

import 'package:conversational_agent_client/src/domain/recommendation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  const News._();

  factory News(
      {required final String id,
      required final String title,
      required final String summary,
      @JsonKey(name: 'article_url') required final String articleUrl,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(name: 'date_created') required final String dateCreated,
      required final List<Recommendation> recommendations}) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);

  static List<News> getNews(List<dynamic> json) {
    return json.map<News>((data) => News.fromJson(data)).toList();
  }

  /// Converts a JSON string back to a List<News>
  static List<News> fromJsonString(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);

    return _fromJsonList(jsonList.cast<Map<String, dynamic>>());
  }

  /// Converts a list of JSON maps back to a List<News>
  static List<News> _fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => News.fromJson(json)).toList();
  }
}
