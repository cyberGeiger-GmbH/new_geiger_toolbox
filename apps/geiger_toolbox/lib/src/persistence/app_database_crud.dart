import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/persistence/app_database.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../exceptions/app_exception.dart';

part 'app_database_crud.g.dart';

extension AppDatabaseCrud on AppDatabase {
  Future<void> synFromRemote(List<News> newsList) async {
    try {
      await transaction(() async {
        var newsOrder = 1;
        var recomOrder = 2;
        var offerOrder = 3;

        for (var newsData in newsList) {
          //insert news
          final newsCompanion = NewsInfoCompanion(
            id: Value(newsData.id),
            order: Value(newsOrder),
            title: Value(newsData.title),
            summary: Value(newsData.summary),
            imageUrl: Value(newsData.imageUrl),
            dateCreated: Value(newsData.dateCreated),
          );
          await into(newsInfo).insertOnConflictUpdate(newsCompanion);
          newsOrder++;

          //insert recommendations for each news
          for (var recomData in newsData.recommendations) {
            final reco = RecommendationsCompanion(
              id: Value(recomData.id),
              newsId: Value(newsData.id),
              name: Value(recomData.name),
              order: Value(recomOrder),
            );
            await into(recommendations).insertOnConflictUpdate(reco);
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
              await into(offerings).insertOnConflictUpdate(offer);
              offerOrder++;
            }
          }
        }
      });
    } catch (e, s) {
      throw DataBaseException(e.toString(), s.toString());
    }
  }

  Future<void> forceSync(List<News> data) async {
    try {
      await synFromRemote(data);
    } catch (e, s) {
      // await deleteAllNewsRecommendationAndOfferings();
      //await synFromRemote(data);
    }
  }

  // ************* News *************

  Future<void> deleteAllNewsRecommendationAndOfferings() async {
    await transaction(() async {
      await delete(newsInfo).go();
      await delete(recommendations).go();
      await delete(offerings).go();
    });
  }

//get news object

  Future<List<News>> fetchAllNewsRecommendationAndOffferings() async {
    final newsWithRecoAndOffering = await (select(newsInfo).join(
      [
        leftOuterJoin(
          recommendations,
          recommendations.newsId.equalsExp(newsInfo.id),
        ),
        leftOuterJoin(
          offerings,
          offerings.recommendationId.equalsExp(recommendations.id),
        )
      ],
    )..orderBy(
            [
              OrderingTerm.asc(newsInfo.order),
              OrderingTerm.asc(recommendations.order),
              OrderingTerm.desc(offerings.order),
            ],
          ))
        .get();

    //Tranfrom the query inot a list of News with their associated Recommendation and task;
    final List<News> newsResult = [];
    final List<Recommendation> recosList = [];
    final Map<String, List<Offering>> offerMap = {};

    for (final row in newsWithRecoAndOffering) {
      final newsEntry = row.readTable(newsInfo);
      //read recommendation
      final recommendationEntry = row.readTable(recommendations);
      // read offering
      final offeringEntry = row.readTableOrNull(offerings);

      // add offfer to the corresponding list in offerMap
      if (offeringEntry != null) {
        final offer =
            Offering(name: offeringEntry.name, summary: offeringEntry.summary);
        offerMap.putIfAbsent(recommendationEntry.id, () => []).add(offer);
      }

      // if the recommendation is not yet in the list add it
      if (!recosList.any((value) => value.id == recommendationEntry.id)) {
        final reco = Recommendation(
            id: recommendationEntry.id,
            name: recommendationEntry.name,
            offerings: offerMap[recommendationEntry.id] ?? []);
        recosList.add(reco);
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
            recommendations: recosList);
        newsResult.add(news);
      }
    }
    return newsResult;
  }
}

@riverpod
Future<List<News>> fetchAllNews(Ref ref) async {
  final area = await ref
      .watch(appDatabaseProvider)
      .fetchAllNewsRecommendationAndOffferings();
  debugPrint("all data => $area");
  return area;
}
