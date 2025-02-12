import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_article_log_repository.g.dart';

//This class logs the curretent state of the [News] object made by the user

class NewsArticleLogRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Logger get _log => ref.read(logHandlerProvider("TodoOfferingRepository"));

  NewsArticleLogRepository(this.ref);

  Future<List<NewsActicle>> getObject() async {
    final newsWithRecoAndOffering = await (_db.select(_db.newsInfo).join(
      [
        leftOuterJoin(
          _db.recommendations,
          _db.recommendations.newsId.equalsExp(_db.newsInfo.id),
        ),
        leftOuterJoin(
          _db.recommendationOfferings,
          _db.recommendationOfferings.recommendationId
              .equalsExp(_db.recommendations.id),
        ),
        leftOuterJoin(
          _db.todoOfferings,
          _db.todoOfferings.offeringId
              .equalsExp(_db.recommendationOfferings.id),
        ),
      ],
    )).get();
    //Tranfrom the query inot a list of News with their associated Recommendation and task;
    final List<NewsActicle> newsObj = [];
    final Map<String, List<Protection>> proObjMap = {};

    for (var rows in newsWithRecoAndOffering) {
      final newsEntry = rows.readTable(_db.newsInfo);
      //read recommendation
      final recommendationEntry = rows.readTableOrNull(_db.recommendations);

      final offeringEntry = rows.readTableOrNull(_db.recommendationOfferings);

      final todoOfferingEntry = rows.readTableOrNull(_db.todoOfferings);

      if (recommendationEntry != null && offeringEntry != null) {
        final protection = Protection(
            name: offeringEntry.name,
            summary: offeringEntry.summary,
            status: todoOfferingEntry?.offeringStatus.name ?? "recommended");

        proObjMap
            .putIfAbsent(recommendationEntry.newsId, () => [])
            .add(protection);

        if (!proObjMap.containsKey(recommendationEntry.newsId)) {
          proObjMap[recommendationEntry.newsId] = [];
        }
      }

      // if the news is not yet in the list add it
      if (!newsObj.any((value) => value.id == newsEntry.id)) {
        final obj = NewsActicle(
          id: newsEntry.id,
          name: newsEntry.title,
          description: newsEntry.summary,
          type: newsEntry.newsCategorg,
          protection: proObjMap[newsEntry.id] ?? [],
        );

        newsObj.add(obj);
      }
    }

    return newsObj;
  }
}

@riverpod
Future<List<NewsActicle>> fetchNewsArticle(Ref ref) async {
  final obj = NewsArticleLogRepository(ref);
  return obj.getObject();
}
