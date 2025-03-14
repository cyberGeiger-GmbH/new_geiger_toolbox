import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'news_feed_remote_repository.g.dart';

class NewsFeedRemoteRepository {
  final Ref ref;

  Logger get _log => ref.read(logHandlerProvider("$NewsFeedRemoteRepository"));
  NewsFeedRemoteRepository(this.ref);

  Future<List<News>> fetchNewsUpdate({required UserProfileModel smeProfile}) async {
    try {
      final newsRepo = ref.read(newsRepositoryProvider);
      final data = await newsRepo.fetchNews(userProfile: smeProfile);
      _log.i("total news received > ${data.length}");

      return data;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
NewsFeedRemoteRepository newsFeedRemoteRepository(Ref ref) {
  return NewsFeedRemoteRepository(ref);
}
