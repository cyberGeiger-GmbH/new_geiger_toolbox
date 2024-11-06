import 'package:conversational_agent_client/src/domain/news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_object.freezed.dart';
part 'news_object.g.dart';

@freezed
class NewsObject with _$NewsObject {
  const NewsObject._();

  factory NewsObject({required final List<News> news}) = _NewsObject;

  factory NewsObject.fromJson(Map<String, dynamic> json) =>
      _$NewsObjectFromJson(json);

  static NewsObject getNewsObj(List<dynamic> json) {
    final newsItems = json.map<News>((data) => data.fromJson(data)).toList();
    return NewsObject(news: newsItems);
  }
}
