library conversational_agent_client;

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
}
