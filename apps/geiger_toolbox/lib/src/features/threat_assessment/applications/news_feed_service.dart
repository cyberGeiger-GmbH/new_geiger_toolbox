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
      final userData = await ref.read(fetchUserDataProvider.future);
      final currentUserDeviceInfo = Asset(
          type: _deviceType.type,
          version: _deviceType.version,
          model: _deviceType.model);
      Profile? profile;
      if (userData != null) {
        final user = userData.user;
        profile = Profile.withDefaultTimestamp(
            id: userData.id.toString(),
            actor: Actor(
              companyName: user.companyName,
              location: user.location,
              companyDescription: user.description,
              assets: [currentUserDeviceInfo],
            ),
            verb: Verb(name: "User profile created"));
      } else {
        profile = Profile.withoutActor(
            id: "",
            verb: Verb(name: "initial scan without company profile"),
            assets: [currentUserDeviceInfo]);
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
