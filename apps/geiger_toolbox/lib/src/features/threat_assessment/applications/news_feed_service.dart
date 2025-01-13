import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/news_feed_cache_repository.dart';
import 'package:geiger_toolbox/src/utils/device_info.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote/news_feed_remote_repository.dart';

part 'news_feed_service.g.dart';

class NewsFeedService {
  final Ref ref;

  NewsFeedCacheRepository get cache =>
      ref.read(newsFeedCacheRepositoryProvider);

  NewsFeedService(this.ref);

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  Future<void> cacheNews() async {
    try {
      final remoteRepo = ref.read(newsFeedRemoteRepositoryProvider);
      final user = await ref.read(fetchUserProvider.future);

      Profile? profile;
      if (user != null) {
        profile = Profile(
            location: user.location,
            companyName: user.companyName,
            description: user.description,
            version: _deviceType.version,
            deviceModel: _deviceType.model,
            deviceType: _deviceType.type);
      }
      debugPrint("user profile => $profile");
      List<News> data = await remoteRepo.fetchNewsUpdate(smeProfile: profile);
      if (data.isNotEmpty) {
        await cache.synFromRemote(data: data);
      }
    } catch (e, s) {
      ref.read(appLoggerProvider).logError(e, s);
      rethrow;
    }
  }

  Future<void> cleanNewsCache() async {
    await cache.deleteNews();
  }

  // void getDevice() async {
  //   final devicePlugin = ref.read(deviceInfoProvider);
  //   final deviceType = ref.read(deviceTypeProvider);
  //   if(deviceType.)

  // }
}

@riverpod
NewsFeedService newsFeedService(Ref ref) {
  return NewsFeedService(ref);
}

@riverpod
Stream<List<News>> watchNewsFeeds(Ref ref) {
  final cachedRepos = ref.watch(newsFeedCacheRepositoryProvider);
  return cachedRepos.watchNewsList();
}

@riverpod
Stream<News?> watchNewsFeedByTitle(Ref ref, {required String newsTitle}) {
  final cachedRepos = ref.watch(newsFeedCacheRepositoryProvider);
  return cachedRepos.watchNewsByTitle(title: newsTitle);
}
