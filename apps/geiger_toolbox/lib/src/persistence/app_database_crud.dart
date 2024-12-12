import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/persistence/app_database.dart';
import 'package:drift/drift.dart';
import 'package:conversational_agent_client/conversational_agent_client.dart'
    as client;

extension AppDatabaseCrud on AppDatabase {
  Future<void> synFromRemote(List<client.News> newsList) async {
    await transaction(() async {
      var newsOrder = 1;
      var recomOrder = 2;
      var offerOrder = 3;

      for (var newsData in newsList) {
        //insert news
        final newsCompanion = NewsCompanion(
          id: Value(newsData.id),
          order: Value(newsOrder),
          title: Value(newsData.title),
          summary: Value(newsData.summary),
          imageUrl: Value(newsData.imageUrl),
          dateCreated: Value(newsData.dateCreated),
        );
        await into(news).insertOnConflictUpdate(newsCompanion);
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
  }

  // ************* News*************

  Future<void> deleteAllNewsRecommendationAndOffers() async {
    await transaction(() async {
      await delete(news).go();
      await delete(recommendations).go();
      await delete(offerings).go();
    });
  }
}
