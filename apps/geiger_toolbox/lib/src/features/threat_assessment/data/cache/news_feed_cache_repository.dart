// ignore_for_file: avoid-throw-in-catch-block

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/error_logger.dart';
import 'package:geiger_toolbox/src/extensions/news_extension.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/utils/sembast_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';

import '../../../../exceptions/app_exception.dart';

part 'news_feed_cache_repository.g.dart';

class NewsFeedCacheRepository {
  final Ref ref;

  static const newsObjectsKey = 'newsObject';

  SembastDataStore get _sembastDataStore {
    return ref.read(sembastDataStoreProvider).requireValue;
  }

  NewsFeedCacheRepository(this.ref);

///store news in localstorage
  Future<void> cacheNewsFeed(
      {Profile? profile, required List<News> data}) async {
    try {
      //cache data
      await _storeNewsFeed(data.toJsonString());
    } catch (e, s) {
      ref.read(errorLoggerProvider).logError(e, s);
      throw CachedNewsFeedStoreException();
    }
  }

/// retrive store news object
  Stream<List<News>> watchNewsFeeds() {
    final dataStore = _sembastDataStore;
    final record = dataStore.store.record(newsObjectsKey);
    final db = dataStore.db;

    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null) {
        final List<News> data = News.fromJsonString(snapshot.value as String);
        debugPrint("News from cache total => ${data.length}");

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

  Future<void> _storeNewsFeed(String jsonNews) async {
    final dataStore = _sembastDataStore;
    final db = dataStore.db;
    final store = dataStore.store;
    await store.record(newsObjectsKey).put(db, jsonNews);
  }

  static News? _getNews(
      {required List<News> newsfeeds, required String newsTitle}) {
    try {
      return newsfeeds.firstWhere(
          (newsfeed) => newsfeed.title.replaceSpacesWithHyphen == newsTitle);
    } catch (e) {
      return null;
    }
  }
}

@Riverpod(keepAlive: true)
NewsFeedCacheRepository newsFeedCacheRepository(Ref ref) {
  return NewsFeedCacheRepository(ref);
}
