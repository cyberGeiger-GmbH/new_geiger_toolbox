import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/error_logger.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/news_feed_sembast_cache_repository.dart';


import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote/news_feed_remote_repository.dart';

part 'news_feed_service.g.dart';

class NewsFeedService {
  final Ref ref;
  NewsFeedService(this.ref);

  Future<void> cacheNews({Profile? profile}) async {
    try {
      final remoteRepo = ref.read(newsFeedRemoteRepositoryProvider);
      //todo: read from sme profile repository
      // final defaultProfile = Profile(
      //     location: "Zurich",
      //     digitalInfrastructure: DigitalInfrastructure(
      //         infoAbout: ["password", "teamView", "post finance"]));
      List<News> data = await remoteRepo.fetchNewsUpdate();
      if (data.isNotEmpty) {
        final cache = ref.read(newsFeedSembastCacheRepositoryProvider);
        await cache.synFromRemote(data: data);
      }
    } catch (e, s) {
      ref.read(errorLoggerProvider).logError(e, s);
      rethrow;
    }
  }

  Future<void> cleanNewsCache() async {
    final cache = ref.read(newsFeedSembastCacheRepositoryProvider);
    await cache.deleteNews();
  }
}

@riverpod
NewsFeedService newsFeedService(Ref ref) {
  return NewsFeedService(ref);
}

@riverpod
Stream<List<News>> watchNewsFeeds(Ref ref) {
  final cachedRepos = ref.watch(newsFeedSembastCacheRepositoryProvider);

  return cachedRepos.watchNewsList();
}

@riverpod
Stream<News?> watchNewsFeedByTitle(Ref ref, {required String newsTitle}) {
  final cachedRepos = ref.watch(newsFeedSembastCacheRepositoryProvider);

  return cachedRepos.watchNewsByTitle(title: newsTitle);
}
