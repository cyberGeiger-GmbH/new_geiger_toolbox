import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'acting_object_repository.g.dart';

class ActingObjectRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  ActingObjectRepository(this.ref);

  Future<ActingObject> getObject() async {
    final newsWithRecoAndOffering = await (_db.select(_db.newsInfo).join(
      [
        leftOuterJoin(
          _db.recommendations,
          _db.recommendations.newsId.equalsExp(_db.newsInfo.id),
        ),
        leftOuterJoin(
          _db.offerings,
          _db.offerings.recommendationId.equalsExp(_db.recommendations.id),
        ),
        leftOuterJoin(
          _db.todoOfferingStatuses,
          _db.todoOfferingStatuses.offeringId.equalsExp(_db.offerings.id),
        )
      ],
    )..orderBy(
            [
              OrderingTerm.asc(_db.newsInfo.order),
              OrderingTerm.asc(_db.recommendations.order),
              OrderingTerm.asc(_db.offerings.order),
            ],
          ))
        .get();
    //Tranfrom the query inot a list of News with their associated Recommendation and task;
    final List<Definition> newsObj = [];
    final Map<String, List<DefinitionExtension>> recoObjMap = {};
    final Map<String, List<Implementation>> offerStatusMap = {};

    for (var rows in newsWithRecoAndOffering) {
      final newsEntry = rows.readTable(_db.newsInfo);
      //read recommendation
      final recommendationEntry = rows.readTableOrNull(_db.recommendations);

      final offeringEntry = rows.readTableOrNull(_db.offerings);

      final todoOfferingStatus = rows.readTableOrNull(_db.todoOfferingStatuses);

      // add offfer to the corresponding list in offerMap
      if (offeringEntry != null) {
        // final offer =
        final imp = Implementation(
            name: offeringEntry.name,
            summary: offeringEntry.summary,
            implemented: todoOfferingStatus?.added ?? false);
        offerStatusMap
            .putIfAbsent(offeringEntry.recommendationId, () => [])
            .add(imp);
      }

      // if the recommendation is not yet in the list add it
      if (recommendationEntry != null &&
          !recoObjMap.entries
              .any((value) => value.key == recommendationEntry.newsId)) {
        final ext = DefinitionExtension(
            recommendationType: recommendationEntry.name,
            implementations: offerStatusMap[recommendationEntry.id] ?? []);

        recoObjMap.putIfAbsent(recommendationEntry.newsId, () => []).add(ext);
      }

      // if the news is not yet in the list add it
      if (!newsObj.any((value) => value.id == newsEntry.id)) {
        final obj = Definition(
          id: newsEntry.id,
          name: newsEntry.title,
          description: newsEntry.summary,
          extensions: recoObjMap[newsEntry.id] ?? [],
        );

        newsObj.add(obj);
      }
    }

    return ActingObject(definition: newsObj);
  }
}

@riverpod
Future<ActingObject> fetchActingObject(Ref ref) async {
  final obj = ActingObjectRepository(ref);
  return obj.getObject();
}
