import 'package:conversational_agent_client/conversational_agent_client.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/news_extension.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/persistence/sembast_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';

import '../../../../exceptions/app_exception.dart';

part 'news_feed_cache_repository.g.dart';

class NewsFeedCacheRepository {
  NewsFeedCacheRepository(this.ref);
  final Ref ref;

  static const newsObjectsKey = 'newsObject';

  Future<void> cacheNewsFeed(
      {Profile? profile, required List<News> data}) async {
    try {
      //cache data
      await _storeNewsFeed(data.toJsonString());
    } catch (e) {
      throw CachedNewsFeedStoreException();
    }
  }

  Future<void> _storeNewsFeed(String jsonNews) async {
    final dataStore = _sembastDataStore;
    final db = dataStore.db;
    final store = dataStore.store;
    await store.record(newsObjectsKey).put(db, jsonNews);
  }

  Stream<List<News>> watchNewsFeeds() {
    final dataStore = _sembastDataStore;
    final record = dataStore.store.record(newsObjectsKey);
    final db = dataStore.db;

    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null) {
        final List<News> data = News.fromJsonString(snapshot.value as String);
        return data;
      } else {
        return [];
      }
    });
  }

  Stream<News?> watchNewsFeed({required String newsTitle}) {
    return watchNewsFeeds()
        .map((newsfeed) => _getNews(newsfeeds: newsfeed, newsTitle: newsTitle));
  }

  static News? _getNews(
      {required List<News> newsfeeds, required String newsTitle}) {
    try {
      final result = newsfeeds.firstWhere(
          (newsfeed) => newsfeed.title.replaceSpacesWithHyphen == newsTitle);

      return result;
    } catch (e) {
      return null;
    }
  }

  SembastDataStore get _sembastDataStore {
    return ref.read(sembastDataStoreProvider).requireValue;
  }
}

@Riverpod(keepAlive: true)
NewsFeedCacheRepository newsFeedCacheRepository(Ref ref) {
  return NewsFeedCacheRepository(ref);
}
