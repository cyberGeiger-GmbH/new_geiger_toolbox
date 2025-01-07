import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'news_feed_remote_repository.g.dart';

class NewsFeedRemoteRepository {
  final Ref ref;
  NewsFeedRemoteRepository(this.ref);

  Future<List<News>> fetchNewsUpdate({final Profile? smeProfile}) async {
    final newsRepo = ref.read(newsRepositoryProvider);
    final data = await newsRepo.fetchNews(profile: smeProfile);
    debugPrint("News from remote total => ${data.length}");

    return data;
  }
}

@riverpod
NewsFeedRemoteRepository newsFeedRemoteRepository(Ref ref) {
  return NewsFeedRemoteRepository(ref);
}
