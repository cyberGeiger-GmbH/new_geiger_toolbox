import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';
import 'package:geiger_toolbox/src/utils/date_time_formatter.dart';

import 'package:drift/drift.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../exceptions/app_exception.dart';

part 'local_news_feed_repository.g.dart';

class LocalNewsFeedRepository {
  LocalNewsFeedRepository(this.ref);

  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Logger get _log => ref.read(logHandlerProvider("LocalNewsFeedRepository"));
  AppLogger get _appLogger => ref.read(appLoggerProvider);

  //resolve news conflict on rescanning
  Future<void> resolveNewsConflict({required List<News> data}) async {
    try {
      await _synFromRemote(data: data);
    } catch (e, s) {
      //* if sync failed, delete all news and recommendations
      await deleteNewsObject();
      // * Then try to recover by inserting again
      await _synFromRemote(data: data);
      //fail silently don't throw an exception in staging and production
      if (getFlavor() == Flavor.dev) rethrow;
      _appLogger.logError(e, s);
    }
  }

  Future<void> _synFromRemote({required List<News> data}) async {
    try {
      final uniqueNews = await _uniqueNews(newObj: data);

      if (uniqueNews.isEmpty) {
        _log.w("news feed data already existing");
        _log.w(NewsFeedAlreadyExistsException());
        return;
      }

      _log.i("storing new news locally...");

      // Prepare companions
      final newsCompanions = <NewsInfoCompanion>[];
      final recoCompanions = <RecommendationsCompanion>[];
      final offerCompanions = <RecommendationOfferingsCompanion>[];

      for (var newsData in uniqueNews) {
        final newsId = newsData.id.toLowerCase();
        final dateCreated = ref.read(
          stringToDateProvider(
            inputDate: newsData.dateCreated.isEmpty ? DateTime.now().toString() : newsData.dateCreated,
          ),
        );

        newsCompanions.add(
          NewsInfoCompanion(
            id: Value(newsId),
            title: Value(newsData.title),
            summary: Value(newsData.summary),
            newsCategory: Value(newsData.newsCategory),
            imageUrl: Value(newsData.imageUrl),
            dateCreated: Value(dateCreated),
          ),
        );

        for (var recomData in newsData.recommendations) {
          final recoId = "${recomData.id.toLowerCase()}_$newsId";

          recoCompanions.add(
            RecommendationsCompanion(
              id: Value(recoId),
              newsId: Value(newsId),
              name: Value(recomData.name),
              rationale: Value(recomData.rationale),
            ),
          );

          for (var offerData in recomData.offerings) {
            final id = "${recoId}_${offerData.name.replaceSpacesWithUnderscore}";

            offerCompanions.add(
              RecommendationOfferingsCompanion(
                id: Value(id),
                recommendationId: Value(recoId),
                name: Value(offerData.name),
                summary: Value(offerData.summary),
              ),
            );
          }
        }
      }

      // Execute inserts in a single transaction
      await _db.transaction(() async {
        for (final news in newsCompanions) {
          await _db.into(_db.newsInfo).insertOnConflictUpdate(news);
        }

        for (final reco in recoCompanions) {
          await _db.into(_db.recommendations).insertOnConflictUpdate(reco);
        }

        for (final offer in offerCompanions) {
          await _db.into(_db.recommendationOfferings).insertOnConflictUpdate(offer);
        }
      });

      _log.i("done storing");
    } catch (e, s) {
      _log.e("error:$e, stack:$s");
      rethrow;
    }
  }

  //remove duplicate news by id
  Future<List<News>> _uniqueNews({required List<News> newObj}) async {
    try {
      if (newObj.isEmpty) return [];

      final prev = await fetchNewsList();

      final combinedList = [...prev, ...newObj];

      // Normalize and count by lowercase ID
      final countMap = <String, int>{};
      final idCache = <News, String>{};

      for (final news in combinedList) {
        final id = news.id.toLowerCase();
        idCache[news] = id;
        countMap[id] = (countMap[id] ?? 0) + 1;
      }

      // Keep only unique items based on ID
      return combinedList.where((news) => countMap[idCache[news]] == 1).toList();
    } catch (e, s) {
      _log.e("$e, $s");
      rethrow;
    }
  }

  Future<void> deleteNewsObject() async {
    try {
      _log.i("deletign news...");
      await _db.transaction(() async {
        await _db.delete(_db.newsInfo).go();
        await _db.delete(_db.recommendations).go();
        await _db.delete(_db.recommendationOfferings).go();
      });
      _log.i("news deleted");
    } catch (e) {
      _log.e(e);
      throw DataBaseException();
    }
  }

  // for testing purpose
  Future<void> deleteData() async {
    try {
      _log.i("deletign news...");
      await _db.transaction(() async {
        await _db.delete(_db.newsInfo).go();
        await _db.delete(_db.recommendations).go();
        await _db.delete(_db.recommendationOfferings).go();
        await _db.delete(_db.todoOfferings).go();
      });
      _log.i("news deleted");
    } catch (e) {
      _log.e(e);
      throw DataBaseException();
    }
  }

  ///check if news table is empty (used by app startup logic)
  Future<bool> isNewsTableEmpty() async {
    final query = _db.selectOnly(_db.newsInfo)..addColumns([_db.newsInfo.id.count()]);
    final result = await query.map((row) => row.read<int>(_db.newsInfo.id.count())).getSingle();
    return result == 0;
  }

  //get news object
  //sort by recent news and
  Stream<List<TypedResult>> _sortNewsInfo({bool sort = true}) {
    final newsInfoQuery = _db.select(_db.newsInfo);

    final joint = newsInfoQuery.join([
      leftOuterJoin(_db.recommendations, _db.recommendations.newsId.equalsExp(_db.newsInfo.id)),
      leftOuterJoin(
        _db.recommendationOfferings,
        _db.recommendationOfferings.recommendationId.equalsExp(_db.recommendations.id),
      ),
    ]);
    if (sort) {
      joint.orderBy([OrderingTerm.desc(_db.newsInfo.dateCreated)]);
    } else {
      joint.orderBy([OrderingTerm.asc(_db.newsInfo.dateCreated)]);
    }
    return joint.watch();
  }

  //get older news
  Stream<List<TypedResult>> _olderNewsInfo({required DateTime older}) {
    return (_db.select(_db.newsInfo).join([
            leftOuterJoin(_db.recommendations, _db.recommendations.newsId.equalsExp(_db.newsInfo.id)),
            leftOuterJoin(
              _db.recommendationOfferings,
              _db.recommendationOfferings.recommendationId.equalsExp(_db.recommendations.id),
            ),
          ])
          ..where(_db.newsInfo.dateCreated.isSmallerOrEqualValue(older))
          ..orderBy([OrderingTerm.desc(_db.newsInfo.dateCreated)]))
        .watch();
  }

  Stream<List<News>> watchNewsList({bool sort = true}) {
    _log.i("watching ${sort ? 'Recent' : 'Old'} List<News> ...");
    final newsWithRecoAndOffering = _sortNewsInfo(sort: sort);

    return newsWithRecoAndOffering.map((rows) {
      final List<News> newsResult = [];
      final Map<String, Set<Recommendation>> recosMap = {};
      final Map<String, List<Offering>> offerMap = {};

      // First pass: Process all offerings
      for (final row in rows) {
        final offeringEntry = row.readTableOrNull(_db.recommendationOfferings);
        if (offeringEntry != null) {
          final offer = Offering(name: offeringEntry.name, summary: offeringEntry.summary);
          offerMap.putIfAbsent(offeringEntry.recommendationId, () => []).add(offer);
        }
      }

      // Second pass: Create recommendations with complete offering lists
      for (final row in rows) {
        final recommendationEntry = row.readTableOrNull(_db.recommendations);
        if (recommendationEntry != null) {
          final reco = Recommendation(
            id: recommendationEntry.id,
            rationale: recommendationEntry.rationale,
            name: recommendationEntry.name,
            offerings: offerMap[recommendationEntry.id] ?? [],
          );
          recosMap.putIfAbsent(recommendationEntry.newsId, () => {}).add(reco);
        }
      }

      // Final pass: Create news objects with complete recommendation lists
      for (final row in rows) {
        final newsEntry = row.readTable(_db.newsInfo);
        if (!newsResult.any((value) => value.id == newsEntry.id)) {
          final news = News(
            id: newsEntry.id,
            title: newsEntry.title,
            summary: newsEntry.summary,
            newsCategory: newsEntry.newsCategory,
            articleUrl: "",
            imageUrl: newsEntry.imageUrl,
            dateCreated: "${newsEntry.dateCreated}",
            recommendations: (recosMap[newsEntry.id] ?? {}).toList(),
          );
          newsResult.add(news);
        }
      }

      return newsResult;
    });
  }

  Future<List<News>> fetchNewsList() async {
    final newsWithRecoAndOffering =
        await (_db.select(_db.newsInfo).join([
          leftOuterJoin(_db.recommendations, _db.recommendations.newsId.equalsExp(_db.newsInfo.id)),
          leftOuterJoin(
            _db.recommendationOfferings,
            _db.recommendationOfferings.recommendationId.equalsExp(_db.recommendations.id),
          ),
        ])).get();

    //Transform the query into a list of News with their associated Recommendation and task;
    final List<News> newsResult = [];
    final Map<String, Set<Recommendation>> recosMap = {};
    final Map<String, List<Offering>> offerMap = {};

    // First pass: Process all offerings and recommendations
    for (var rows in newsWithRecoAndOffering) {
      final offeringEntry = rows.readTableOrNull(_db.recommendationOfferings);

      // Add offerings to the corresponding list in offerMap
      if (offeringEntry != null) {
        final offer = Offering(name: offeringEntry.name, summary: offeringEntry.summary);
        offerMap.putIfAbsent(offeringEntry.recommendationId, () => []).add(offer);
      }
    }

    // Second pass: Create recommendations with complete offering lists
    for (var rows in newsWithRecoAndOffering) {
      final recommendationEntry = rows.readTableOrNull(_db.recommendations);

      if (recommendationEntry != null) {
        final reco = Recommendation(
          id: recommendationEntry.id,
          name: recommendationEntry.name,
          rationale: recommendationEntry.rationale,
          offerings: offerMap[recommendationEntry.id] ?? [],
        );

        // Initialize Set if needed
        recosMap.putIfAbsent(recommendationEntry.newsId, () => {});
        recosMap[recommendationEntry.newsId]!.add(reco);
      }
    }

    // Final pass: Create news objects with complete recommendation lists
    for (var rows in newsWithRecoAndOffering) {
      final newsEntry = rows.readTable(_db.newsInfo);

      // Only add news if not already added
      if (!newsResult.any((value) => value.id == newsEntry.id)) {
        final news = News(
          id: newsEntry.id,
          title: newsEntry.title,
          newsCategory: newsEntry.newsCategory,
          summary: newsEntry.summary,
          articleUrl: "",
          imageUrl: newsEntry.imageUrl,
          dateCreated: "${newsEntry.dateCreated}",
          recommendations: (recosMap[newsEntry.id] ?? {}).toList(),
        );

        newsResult.add(news);
      }
    }

    return newsResult;
  }

  Future<News> fetchNewsById({required String newsId}) async {
    _log.i("fetching news by id");
    final data = await fetchNewsList();

    return _getNews(newsfeeds: data, newsId: newsId);
  }

  News _getNews({required List<News> newsfeeds, required String newsId}) {
    try {
      final obj = newsfeeds.firstWhere((news) => news.id == newsId.toLowerCase());
      return obj;
    } on StateError {
      throw StateError("No news found with id: $newsId,");
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
LocalNewsFeedRepository localNewsFeedRepository(Ref ref) {
  return LocalNewsFeedRepository(ref);
}

@riverpod
Future<List<News>> fetchNewsList(Ref ref) {
  final repo = ref.watch(localNewsFeedRepositoryProvider);
  return repo.fetchNewsList();
}

@Riverpod(keepAlive: true)
Future<bool> isNewsTableEmpty(Ref ref) async {
  final repo = ref.watch(localNewsFeedRepositoryProvider);
  return repo.isNewsTableEmpty();
}
