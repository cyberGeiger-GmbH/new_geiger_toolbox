// ignore_for_file: avoid-throw-in-catch-block

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/extensions/news_extension.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/utils/sembast_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';

import '../../../../exceptions/app_exception.dart';

part 'news_feed_sembast_cache_repository.g.dart';

class NewsFeedSembastCacheRepository {
  final Ref ref;

  static const newsObjectsKey = 'newsObject';

  SembastDataStore get _sembastDataStore {
    return ref.read(sembastDataStoreProvider).requireValue;
  }

  NewsFeedSembastCacheRepository(this.ref);

  ///store news in localstorage
  Future<void> synFromRemote({required List<News> data}) async {
    try {
      //cache data
      await _storeNewsFeed(data.toJsonString());
    } catch (e, s) {
      ref.read(appLoggerProvider).logError(e, s);
      throw CachedNewsFeedStoreException();
    }
  }

  /// retrive store news object
  Stream<List<News>> watchNewsList() {
    final dataStore = _sembastDataStore;
    final record = dataStore.store.record(newsObjectsKey);
    final db = dataStore.db;

    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null) {
        final List<News> data = News.fromJsonString(snapshot.value as String);
        debugPrint(
            "News from cache total from sembast database => ${data.length}");

        return data;
      } else {
        return [];
      }
    });
  }

  Stream<News?> watchNewsByTitle({required String title}) {
    return watchNewsList()
        .map((newsfeed) => _getNews(newsfeeds: newsfeed, newsTitle: title));
  }

  Future<void> deleteNews() async {
    try {
      final dataStore = _sembastDataStore;
      final db = dataStore.db;
      final store = dataStore.store;
      await store.record(newsObjectsKey).delete(db);
    } catch (e) {
      throw DeleteCachedNewsFeedStoreException();
    }
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

@riverpod
NewsFeedSembastCacheRepository newsFeedSembastCacheRepository(Ref ref) {
  return NewsFeedSembastCacheRepository(ref);
}
