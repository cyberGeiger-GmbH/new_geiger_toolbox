library conversational_agent_client;

import 'package:conversational_agent_client/src/domain/vulnerable.dart';
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
      required final String date,
      @JsonKey(name: "image_url") required final String imageUrl,
      required List<Vulnerable> vulnerable}) = _News;

  factory News.fromJson(Map<String, Object?> json) => _$NewsFromJson(json);
}
