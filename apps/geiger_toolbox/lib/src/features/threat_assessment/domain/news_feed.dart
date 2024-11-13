import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
part 'news_feed.freezed.dart';
part 'news_feed.g.dart';

@freezed
@HiveType(typeId: 0)
class NewsFeed with _$NewsFeed {
  const factory NewsFeed({@HiveField(0) required News news}) = _NewsFeed;
}
