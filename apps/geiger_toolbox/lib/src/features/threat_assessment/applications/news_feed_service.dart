import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';


import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_news_feed_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/xapi_profile_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote/news_feed_remote_repository.dart';

part 'news_feed_service.g.dart';

class NewsFeedService {
  final Ref ref;

  LocalNewsFeedRepository get cache =>
      ref.read(newsFeedCacheRepositoryProvider);

  Logger get _log => ref.read(logHandlerProvider("NewsFeedService"));

  NewsFeedService(this.ref);


  Future<void> cacheNews() async {
    try {
      final remoteRepo = ref.read(newsFeedRemoteRepositoryProvider);
      final profile = await _getProfileForNewsFeed();
      _log.i("sending company profile in xapi formate => $profile");
      _log.i("Getting News from Server...");
      List<News> data = await remoteRepo.fetchNewsUpdate(smeProfile: profile);

      if (data.isNotEmpty) {
        _log.i("storing newsfeed locally...");
        await cache.synFromRemote(data: data);
      }
      _log.i("success");
    } catch (e, s) {
      ref.read(appLoggerProvider).logError(e, s);
      _log.e("error => $e");
      rethrow;
    }
  }

  Future<void> cleanNewsCache() async {
    await cache.deleteNews();
  }

  Future<Profile> _getProfileForNewsFeed() async {
    final company = await ref.read(fetchCompanyProvider.future);
    Verb? verb;
    if (company != null) {
      verb = Verb(name: "User profile created");
    } else {
      // todo
    }
    return await ref
        .read(getResultProvider(goodScore: false, verb: verb).future);
  }
}

@riverpod
NewsFeedService newsFeedService(Ref ref) {
  return NewsFeedService(ref);
}

@riverpod
Stream<List<News>> watchRecentNewsFeeds(Ref ref) {
  final cachedRepos = ref.watch(newsFeedCacheRepositoryProvider);
  return cachedRepos.watchNewsList();
}

@riverpod
Stream<List<News>> watchOldNewsFeeds(Ref ref) {
  final cachedRepos = ref.watch(newsFeedCacheRepositoryProvider);
  return cachedRepos.watchNewsList(sort: false);
}

@riverpod
Stream<News?> watchNewsFeedByTitle(Ref ref, {required String newsTitle}) {
  final cachedRepos = ref.watch(newsFeedCacheRepositoryProvider);
  return cachedRepos.watchNewsByTitle(title: newsTitle);
}
