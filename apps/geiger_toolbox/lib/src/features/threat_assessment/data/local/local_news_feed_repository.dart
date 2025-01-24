import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../exceptions/app_exception.dart';

part 'local_news_feed_repository.g.dart';

class LocalNewsFeedRepository {
  LocalNewsFeedRepository(this.ref);

  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Future<void> synFromRemote({required List<News> data}) async {
    // debugPrint("news feed=> $data");

    try {
      await _db.transaction(() async {
        for (var newsData in data) {
          //insert news
          final dateCreated = DateTime.parse(newsData.dateCreated);
          final newsCompanion = NewsInfoCompanion(
            id: Value(newsData.title.replaceSpacesWithHyphen),
            title: Value(newsData.title),
            summary: Value(newsData.summary),
            imageUrl: Value(newsData.imageUrl),
            dateCreated: Value(dateCreated),
          );
          await _db.into(_db.newsInfo).insertOnConflictUpdate(newsCompanion);

          //insert recommendations for each news
          for (var recomData in newsData.recommendations) {
            final reco = RecommendationsCompanion(
              id: Value(recomData.name.replaceSpacesWithHyphen),
              newsId: Value(newsData.title.replaceSpacesWithHyphen),
              name: Value(recomData.name),
            );
            await _db.into(_db.recommendations).insertOnConflictUpdate(reco);

            // insert offering for each recommendation
            for (var offerData in recomData.offerings) {
              //id = combination of offerings name and recom Id
              final id =
                  "${offerData.name.replaceSpacesWithHyphen}${recomData.id}";
              final offer = OfferingsCompanion(
                id: Value(id),
                recommendationId: Value(recomData.name.replaceSpacesWithHyphen),
                name: Value(offerData.name),
                summary: Value(offerData.summary),
              );
              await _db.into(_db.offerings).insertOnConflictUpdate(offer);
            }
          }
        }
      });
    } catch (e, s) {
      throw DataBaseException(error: e.toString(), stack: s.toString());
    }
  }

  Future<void> deleteNews() async {
    try {
      await _db.transaction(() async {
        await _db.delete(_db.newsInfo).go();
        await _db.delete(_db.recommendations).go();
        await _db.delete(_db.offerings).go();
        await _db.delete(_db.todoOfferingStatuses).go();
      });
    } catch (e) {
      throw DataBaseException();
    }
  }

//get news object
//sort by recent news and
  Stream<List<TypedResult>> _sortNewsInfo({bool sort = true}) {
    final newsInfoQuery = _db.select(_db.newsInfo);

    final joint = newsInfoQuery.join(
      [
        leftOuterJoin(
          _db.recommendations,
          _db.recommendations.newsId.equalsExp(_db.newsInfo.id),
        ),
        leftOuterJoin(
          _db.offerings,
          _db.offerings.recommendationId.equalsExp(_db.recommendations.id),
        )
      ],
    );
    if (sort) {
      joint.orderBy([OrderingTerm.desc(_db.newsInfo.dateCreated)]);
    } else {
      joint.orderBy([OrderingTerm.asc(_db.newsInfo.dateCreated)]);
    }
    return joint.watch();
  }

//get older news
  Stream<List<TypedResult>> _olderNewsInfo({required DateTime older}) {
    return (_db.select(_db.newsInfo).join(
      [
        leftOuterJoin(
          _db.recommendations,
          _db.recommendations.newsId.equalsExp(_db.newsInfo.id),
        ),
        leftOuterJoin(
          _db.offerings,
          _db.offerings.recommendationId.equalsExp(_db.recommendations.id),
        )
      ],
    )
          ..where(_db.newsInfo.dateCreated.isSmallerOrEqualValue(older))
          ..orderBy([
            OrderingTerm.desc(_db.newsInfo.dateCreated),
          ]))
        .watch();
  }

  Stream<List<News>> watchNewsList({bool sort = true}) {
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
        //read recommendation
        final recommendationEntry = row.readTableOrNull(_db.recommendations);

        // debugPrint("all recommendations table => $recommendationEntry");
        // read offering
        final offeringEntry = row.readTableOrNull(_db.offerings);
        // debugPrint("all news => $newsEntry");
        // debugPrint("all recommendations => $recommendationEntry");

        // add offfer to the corresponding list in offerMap
        if (offeringEntry != null) {
          final offer = Offering(
              name: offeringEntry.name, summary: offeringEntry.summary);
          offerMap
              .putIfAbsent(offeringEntry.recommendationId, () => [])
              .add(offer);
        }

        // if the recommendation is not yet in the list add it
        if (recommendationEntry != null) {
          if(recosMap.entries.any((value) => value.key == recommendationEntry.newsId)){
             debugPrint("all recom => $recosMap");
          }
          final reco = Recommendation(
              id: recommendationEntry.id,
              name: recommendationEntry.name,
              offerings: offerMap[recommendationEntry.id] ?? []);

          recosMap.putIfAbsent(recommendationEntry.newsId, () => []).add(reco);

          //  debugPrint("all recom => $recosMap");
        }

        // if the news is not yet in the list add it
        if (!newsResult.any((value) => value.id == newsEntry.id)) {
          final news = News(
              id: newsEntry.id,
              title: newsEntry.title,
              summary: newsEntry.summary,
              articleUrl: "",
              imageUrl: newsEntry.imageUrl,
              dateCreated: "${newsEntry.dateCreated}",
              recommendations: recosMap[newsEntry.id] ?? []);

          newsResult.add(news);
        }
      }

      return newsResult;
    });
  }

  Future<List<News>> fetchNewsList() async {
    final newsWithRecoAndOffering = await (_db.select(_db.newsInfo).join(
      [
        leftOuterJoin(
          _db.recommendations,
          _db.recommendations.newsId.equalsExp(_db.newsInfo.id),
        ),
        leftOuterJoin(
          _db.offerings,
          _db.offerings.recommendationId.equalsExp(_db.recommendations.id),
        )
      ],
    )).get();

    //Tranfrom the query inot a list of News with their associated Recommendation and task;
    final List<News> newsResult = [];
    final Map<String, List<Recommendation>> recosMap = {};
    final Map<String, List<Offering>> offerMap = {};

    for (var rows in newsWithRecoAndOffering) {
      final newsEntry = rows.readTable(_db.newsInfo);
      //read recommendation
      final recommendationEntry = rows.readTableOrNull(_db.recommendations);

      // debugPrint("all recommendations table => $recommendationEntry");
      // read offering
      final offeringEntry = rows.readTableOrNull(_db.offerings);
      // debugPrint("all news => $newsEntry");
      // debugPrint("all recommendations => $recommendationEntry");

      // add offfer to the corresponding list in offerMap
      if (offeringEntry != null) {
        final offer =
            Offering(name: offeringEntry.name, summary: offeringEntry.summary);
        offerMap
            .putIfAbsent(offeringEntry.recommendationId, () => [])
            .add(offer);
      }

      // if the recommendation is not yet in the list add it
      if (recommendationEntry != null &&
          !recosMap.entries
              .any((value) => value.key == recommendationEntry.newsId)) {
        final reco = Recommendation(
            id: recommendationEntry.id,
            name: recommendationEntry.name,
            offerings: offerMap[recommendationEntry.id] ?? []);

        recosMap.putIfAbsent(recommendationEntry.newsId, () => []).add(reco);
      }

      // if the news is not yet in the list add it
      if (!newsResult.any((value) => value.id == newsEntry.id)) {
        final news = News(
            id: newsEntry.id,
            title: newsEntry.title,
            summary: newsEntry.summary,
            articleUrl: "",
            imageUrl: newsEntry.imageUrl,
            dateCreated: "${newsEntry.dateCreated}",
            recommendations: recosMap[newsEntry.id] ?? []);

        newsResult.add(news);
      }
    }

    return newsResult;
  }

  Stream<News?> watchNewsByTitle({required String title}) {
    return watchNewsList()
        .map((newsfeed) => _getNews(newsfeeds: newsfeed, newsTitle: title));
  }

  static News? _getNews(
      {required List<News> newsfeeds, required String newsTitle}) {
    try {
      final obj = newsfeeds.firstWhere(
          (news) => news.title.replaceSpacesWithHyphen == newsTitle);

      return obj;
    } catch (e) {
      rethrow;
      //return null;
    }
  }
}

@riverpod
LocalNewsFeedRepository newsFeedCacheRepository(Ref ref) {
  return LocalNewsFeedRepository(ref);
}

@riverpod
Future<List<News>> fetchNewsList(Ref ref) {
  final repo = ref.watch(newsFeedCacheRepositoryProvider);
  return repo.fetchNewsList();
}
