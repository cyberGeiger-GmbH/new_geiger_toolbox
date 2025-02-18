import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/user_profile_model_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_news_feed_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote/news_feed_remote_repository.dart';

part 'news_feed_service.g.dart';

class NewsFeedService {
  final Ref ref;

  LocalNewsFeedRepository get _cache => ref.read(localNewsFeedRepositoryProvider);

  Logger get _log => ref.read(logHandlerProvider("NewsFeedService"));

  NewsFeedService(this.ref);

  Future<void> cacheNews() async {
    _log.i("calls to cache news from server");
    try {
      final remoteRepo = ref.read(newsFeedRemoteRepositoryProvider);

      final userProfileModel = ref.read(userProfileModelSerivceProvider);

      _log.i("sending userProfile model");
      final userProfileState = await userProfileModel.fetchUserProfileModel();
      _log.i("Getting News from Server...");

      List<News> data = await remoteRepo.fetchNewsUpdate(smeProfile: userProfileState);

      if (data.isNotEmpty) {
        _log.i("storing newsfeed locally...");
        await _cache.synFromRemote(data: data);
        await userProfileModel.storePreviousUserProfileState();
      }
      _log.i("success");
    } catch (e, s) {
      ref.read(appLoggerProvider).logError(e, s);
      _log.e("error => $e, $s");
      rethrow;
    }
  }
}

@riverpod
NewsFeedService newsFeedService(Ref ref) {
  return NewsFeedService(ref);
}

@riverpod
Stream<List<News>> watchRecentNewsFeeds(Ref ref) {
  final cachedRepos = ref.watch(localNewsFeedRepositoryProvider);
  return cachedRepos.watchNewsList();
}

@riverpod
Stream<List<News>> watchOldNewsFeeds(Ref ref) {
  final cachedRepos = ref.watch(localNewsFeedRepositoryProvider);
  return cachedRepos.watchNewsList(sort: false);
}

@riverpod
Future<News?> fetchNewsFeedByTitle(Ref ref, {required String newsTitle}) async {
  final cachedRepos = ref.watch(localNewsFeedRepositoryProvider);
  return await cachedRepos.fetchNewsByTitle(title: newsTitle);
}
