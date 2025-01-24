import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_news_feed_repository.dart';
import 'package:geiger_toolbox/src/utils/device_info.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote/news_feed_remote_repository.dart';

part 'news_feed_service.g.dart';

class NewsFeedService {
  final Ref ref;

  LocalNewsFeedRepository get cache =>
      ref.read(newsFeedCacheRepositoryProvider);

  NewsFeedService(this.ref);

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  Future<void> cacheNews() async {
    try {
      final remoteRepo = ref.read(newsFeedRemoteRepositoryProvider);
      final profile = await _getProfileForNewsFeed();
      debugPrint("sending xapi profile to newsFeed => $profile");
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

//get object that the user is working on

  // Future<Acting> _getObject() async {
  //   final todos = ref.read(provider)
  //   final

  // }
  Future<Profile> _getProfileForNewsFeed() async {
    final company = await ref.read(fetchCompanyProvider.future);
    final user = await ref.read(fetchUserProvider.future);
    final userId = user!.userId;
    //final object = await ref.read(fetchActingObjectProvider.future);

    final currentUserDeviceInfo = Asset(
        type: _deviceType.type.name,
        version: _deviceType.version,
        model: _deviceType.model);
    if (company != null) {
      return Profile.withDefaultTimestamp(
          id: userId,
          actor: Actor(
            companyName: company.companyName,
            location: company.location,
            companyDescription: company.description,
            userDevice: currentUserDeviceInfo,
            assets: [],
          ),
          verb: Verb(name: "User profile created"));
    } else {
      return Profile.withoutActor(
        id: userId,
        verb: Verb(name: "initial scan without company profile"),
        currentDevice: currentUserDeviceInfo,
      );
    }
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
