import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../exceptions/app_exception.dart';

part 'news_feed_cache_repository.g.dart';

class NewsFeedCacheRepository {
  NewsFeedCacheRepository(this.ref);

  final Ref ref;

  AppDatabase get db => ref.read(appDatabaseProvider);

  Future<void> synFromRemote({required List<News> data}) async {

    try {
      await db.transaction(() async {
        var newsOrder = 1;
        var recomOrder = 1;
        var offerOrder = 1;

        for (var newsData in data) {
          //insert news
          final newsCompanion = NewsInfoCompanion(
            id: Value(newsData.id),
            order: Value(newsOrder),
            title: Value(newsData.title),
            summary: Value(newsData.summary),
            imageUrl: Value(newsData.imageUrl),
            dateCreated: Value(newsData.dateCreated),
          );
          await db.into(db.newsInfo).insertOnConflictUpdate(newsCompanion);
          newsOrder++;

          //insert recommendations for each news
          for (var recomData in newsData.recommendations) {
            final reco = RecommendationsCompanion(
              id: Value(recomData.id),
              newsId: Value(newsData.id),
              name: Value(recomData.name),
              order: Value(recomOrder),
            );
            await db.into(db.recommendations).insertOnConflictUpdate(reco);
            recomOrder++;

            // insert offering for each recommendation
            for (var offerData in recomData.offerings) {
              final offer = OfferingsCompanion(
                id: Value(offerData.name.replaceSpacesWithHyphen),
                recommendationId: Value(recomData.id),
                order: Value(offerOrder),
                name: Value(offerData.name),
                summary: Value(offerData.summary),
              );
              await db.into(db.offerings).insertOnConflictUpdate(offer);
              offerOrder++;
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
      await db.transaction(() async {
        await db.delete(db.newsInfo).go();
        await db.delete(db.recommendations).go();
        await db.delete(db.offerings).go();
        await db.delete(db.todoOfferingStatuses).go();
      });
    } catch (e) {
      throw DataBaseException();
    }
  }

//get news object

  Stream<List<News>> watchNewsList() {
    final newsWithRecoAndOffering = (db.select(db.newsInfo).join(
      [
        leftOuterJoin(
          db.recommendations,
          db.recommendations.newsId.equalsExp(db.newsInfo.id),
        ),
        leftOuterJoin(
          db.offerings,
          db.offerings.recommendationId.equalsExp(db.recommendations.id),
        )
      ],
    )..orderBy(
            [
              OrderingTerm.asc(db.newsInfo.order),
              OrderingTerm.asc(db.recommendations.order),
              OrderingTerm.asc(db.offerings.order),
            ],
          ))
        .watch();

    //Tranfrom the query inot a list of News with their associated Recommendation and task;
    final List<News> newsResult = [];
    final Map<String, List<Recommendation>> recosMap = {};
    final Map<String, List<Offering>> offerMap = {};

    return newsWithRecoAndOffering.map((rows) {
      for (final row in rows) {
        final newsEntry = row.readTable(db.newsInfo);
        //read recommendation
        final recommendationEntry = row.readTableOrNull(db.recommendations);

        // debugPrint("all recommendations table => $recommendationEntry");
        // read offering
        final offeringEntry = row.readTableOrNull(db.offerings);
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
              dateCreated: newsEntry.dateCreated,
              recommendations: recosMap[newsEntry.id] ?? []);

          newsResult.add(news);
        }
      }

      return newsResult;
    });
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
NewsFeedCacheRepository newsFeedCacheRepository(Ref ref) {
  return NewsFeedCacheRepository(ref);
}
