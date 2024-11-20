// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/news_feed_cache_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote/news_feed_remote_repository.dart';

part 'news_feed_service.g.dart';

class NewsFeedService {
  NewsFeedService(this.ref);

  final Ref ref;

  Future<void> cacheNews({Profile? profile}) async {
    final remoteRepo = ref.read(newsFeedRepositoryProvider);
    final defaultProfile = Profile(
        location: "Zurich",
        digitalInfrastructure: DigitalInfrastructure(
            infoAbout: ["password", "teamView", "post finance"]));
    List<News>? data =
        await remoteRepo.fetchNewsUpdate(smeProfile: profile ?? defaultProfile);
    if (data != null && data.isNotEmpty) {
      final cachedRepos = ref.read(newsFeedCacheRepositoryProvider);
      //cache news Feed
      await cachedRepos.cacheNewsFeed(data: data);
    }
  }
}

@riverpod
NewsFeedService newsFeedService(Ref ref) {
  return NewsFeedService(ref);
}

@Riverpod(keepAlive: true)
Stream<List<News>>? watchtNewsFeed(Ref ref) {
  final cachedRepos = ref.watch(newsFeedCacheRepositoryProvider);
  return cachedRepos.watchNewsFeed();
}
