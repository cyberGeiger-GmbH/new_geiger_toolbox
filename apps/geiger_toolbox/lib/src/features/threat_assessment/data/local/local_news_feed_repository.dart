import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      //fail silently don't throw an exception
      _appLogger.logError(e, s);
    }
  }

  Future<void> _synFromRemote({required List<News> data}) async {
    // debugPrint("news feed=> $data");

    try {
      final uniqueNews = await _uniqueNews(newObj: data);
      if (uniqueNews.isEmpty) {
        _log.w("news feed data already existing");

        // don't throw an exception
        _log.w(NewsFeedAlreadyExistsException());
      } else {
        _log.i("storing new news locally...");
        await _db.transaction(() async {
          for (var newsData in uniqueNews) {
            //insert news
            final dateCreated = ref.read(stringToDateProvider(inputDate: newsData.dateCreated));
            final newsId = newsData.id.toLowerCase();

            final newsCompanion = NewsInfoCompanion(
              id: Value(newsId),
              title: Value(newsData.title),
              summary: Value(newsData.summary),
              newsCategory: Value(newsData.newsCategory),
              imageUrl: Value(newsData.imageUrl),
              dateCreated: Value(dateCreated),
            );
            await _db.into(_db.newsInfo).insertOnConflictUpdate(newsCompanion);

            //insert recommendations for each news
            for (var recomData in newsData.recommendations) {
              //combine recommendation id and news id to avoid conflict
              final recoId = recomData.id.toLowerCase();

              final reco = RecommendationsCompanion(
                id: Value(recoId),
                newsId: Value(newsId),
                name: Value(recomData.name),
                rationale: Value(recomData.rationale),
              );
              await _db.into(_db.recommendations).insertOnConflictUpdate(reco);

              // insert offering for each recommendation
              for (var offerData in recomData.offerings) {
                //id is the combination of recommendation id and offering name
                final id = "${recoId}_${offerData.name.replaceSpacesWithUnderscore}";

                final offer = RecommendationOfferingsCompanion(
                  id: Value(id),
                  recommendationId: Value(recoId),
                  name: Value(offerData.name),
                  summary: Value(offerData.summary),
                );
                await _db.into(_db.recommendationOfferings).insertOnConflictUpdate(offer);
              }
            }
          }
        });
      }
      _log.i("done storing");
    } catch (e, s) {
      _log.e("error:$e, stack:$s");
      rethrow;
    }
  }

  //remove duplicate news by id
  Future<List<News>> _uniqueNews({required List<News> newObj}) async {
    try {
      if (newObj.isNotEmpty) {
        final prev = await fetchNewsList();

        List<News> combinedList = prev + newObj;

        // Count occurrences using a Map
        Map<String, int> countMap = {};

        for (var news in combinedList) {
          countMap[news.id.toLowerCase()] = (countMap[news.id.toLowerCase()] ?? 0) + 1;
        }

        // Filter out users that appear more than once
        List<News> uniqueUsers =
            combinedList.where((data) => countMap[data.id.toLowerCase()] == 1).toList(); // Keep only unique ones

        return uniqueUsers;
      }
      return [];
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
    //final da = ref.read(previousMonthProvider(month: 1));
    // final newsWithRecoAndOffering =
    //     olderNews == null ? _sortNewsInfo() : _olderNewsInfo(older: da);
    final newsWithRecoAndOffering = _sortNewsInfo(sort: sort);
    //Tranfrom the query inot a list of News with their associated Recommendation and task;
    final List<News> newsResult = [];
    final Map<String, List<Recommendation>> recosMap = {};
    final Map<String, List<Offering>> offerMap = {};

    return newsWithRecoAndOffering.map((rows) {
      for (final row in rows) {
        final newsEntry = row.readTable(_db.newsInfo);

        final recommendationEntry = row.readTableOrNull(_db.recommendations);
        final offeringEntry = row.readTableOrNull(_db.recommendationOfferings);

        // Add offerings to the corresponding list in offerMap
        if (offeringEntry != null) {
          final offer = Offering(name: offeringEntry.name, summary: offeringEntry.summary);

          offerMap.putIfAbsent(offeringEntry.recommendationId, () => []).add(offer);
        }

        // Create or update recommendations for the current newsId
        if (recommendationEntry != null) {
          final reco = Recommendation(
            id: recommendationEntry.id,
            rationale: recommendationEntry.rationale,
            name: recommendationEntry.name,
            offerings: offerMap[recommendationEntry.id] ?? [],
          );

          // Ensure the recommendation is added only once for a specific newsId
          if (!recosMap.containsKey(recommendationEntry.newsId)) {
            recosMap[recommendationEntry.newsId] = [];
          }
          // Only add the recommendation if it's not already in the list for the specific newsId
          if (!recosMap[recommendationEntry.newsId]!.any((rec) => rec.id == reco.id)) {
            recosMap[recommendationEntry.newsId]!.add(reco);
          }
        }
        // if the news is not yet in the list add it
        if (!newsResult.any((value) => value.id == newsEntry.id)) {
          final news = News(
            id: newsEntry.id,
            title: newsEntry.title,
            summary: newsEntry.summary,
            newsCategory: newsEntry.newsCategory,
            articleUrl: "",
            imageUrl: newsEntry.imageUrl,
            dateCreated: "${newsEntry.dateCreated}",
            recommendations: recosMap[newsEntry.id] ?? [],
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

    //Tranfrom the query inot a list of News with their associated Recommendation and task;
    final List<News> newsResult = [];
    final Map<String, Set<Recommendation>> recosMap = {};
    final Map<String, List<Offering>> offerMap = {};

    for (var rows in newsWithRecoAndOffering) {
      final newsEntry = rows.readTable(_db.newsInfo);
      //read recommendation
      final recommendationEntry = rows.readTableOrNull(_db.recommendations);

      // debugPrint("all recommendations table => $recommendationEntry");
      // read offering
      final offeringEntry = rows.readTableOrNull(_db.recommendationOfferings);
      // debugPrint("all news => $newsEntry");
      // debugPrint("all recommendations => $recommendationEntry");

      // add offfer to the corresponding list in offerMap
      if (offeringEntry != null) {
        final offer = Offering(name: offeringEntry.name, summary: offeringEntry.summary);
        offerMap.putIfAbsent(offeringEntry.recommendationId, () => []).add(offer);
      }

      // Create or update recommendations for the current newsId
      if (recommendationEntry != null) {
        final reco = Recommendation(
          id: recommendationEntry.id,
          name: recommendationEntry.name,
          rationale: recommendationEntry.rationale,
          offerings: offerMap[recommendationEntry.id] ?? [],
        );

        // Ensure the recommendation is added only once for a specific newsId
        if (!recosMap.containsKey(recommendationEntry.newsId)) {
          recosMap[recommendationEntry.newsId] = {};
        }
        // Only add the recommendation if it's not already in the list for the specific newsId
        if (!recosMap[recommendationEntry.newsId]!.any((rec) => rec.id == reco.id)) {
          recosMap[recommendationEntry.newsId]!.add(reco);
        }
      }

      // if the news is not yet in the list add it
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
