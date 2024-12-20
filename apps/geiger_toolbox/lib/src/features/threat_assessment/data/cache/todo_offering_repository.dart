import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/offering_status.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_offering_repository.g.dart';

typedef RecommendationID = String;

class TodoOfferingRepository {
  final Ref ref;

  AppDatabase get db => ref.read(appDatabaseProvider);

  TodoOfferingRepository(this.ref);

  //update the added status of a given offering
  Future<void> updateTodoOfferingStatus(
      {required OfferingId id, required bool isAdded}) async {
    final offeringStatus = TodoOfferingStatusesCompanion(
      offeringId: Value(id),
      added: Value(isAdded),
    );

    
    /// insert or update the todoOffer status
    await db
        .into(db.todoOfferingStatuses)
        .insertOnConflictUpdate(offeringStatus);
  }

  //Get all Offers that has be added to the todoOfferingStatus
  Stream<List<OfferingStatus>> watchTodoOfferingStatus() {
    //create a join query that include TodoOfferingStatusesTable and OfferingsTable
    final query = db.select(db.offerings).join(
      [
        leftOuterJoin(
          db.todoOfferingStatuses,
          db.todoOfferingStatuses.offeringId.equalsExp(db.offerings.id),
        ),
      ],
    )..orderBy(
        [
          OrderingTerm.asc(db.offerings.order),
        ],
      );
    // transform the query stream into a stream of [OfferingStatus] lists
    return query.watch().map((rows) {
      return rows.map((row) {
        // Read the offerings entry;
        final offeringEntry = row.readTable(db.offerings);
        // Read the todo offering status entry or null if there is no match
        final todoOfferingStatus = row.readTableOrNull(db.todoOfferingStatuses);

        return OfferingStatus(
            offering: Offering(
                name: offeringEntry.name, summary: offeringEntry.summary),
            id: offeringEntry.id,
            added: todoOfferingStatus?.added ?? false);
      }).toList();
    });
  }

  //filter by recommendation id
  Future<List<OfferingStatus>> fetchFilteredOfferingStatus(
      {required String recommendationId}) async {
    //create a join query that include TodoOfferingStatusesTable and OfferingsTable
    final query = db.select(db.offerings).join([
      leftOuterJoin(db.todoOfferingStatuses,
          db.todoOfferingStatuses.offeringId.equalsExp(db.offerings.id))
    ])
      //filter by recommendationID
      ..where(db.offerings.recommendationId.equals(recommendationId))
      ..orderBy(
        [
          OrderingTerm.asc(db.offerings.order),
        ],
      );
    final result = await query.get();
    List<OfferingStatus> statusList = [];
    for (var row in result) {
      // Read the offerings entry;
      final offeringEntry = row.readTable(db.offerings);
      // Read the todo offering status entry or null if there is no match
      final todoOfferingStatus = row.readTableOrNull(db.todoOfferingStatuses);

      statusList.add(OfferingStatus(
          id: offeringEntry.id,
          offering: Offering(
              name: offeringEntry.name, summary: offeringEntry.summary),
          added: todoOfferingStatus?.added ?? false));
    }
    return statusList;
  }

  /// Check if the todo offer Status table is empty
  Future<bool> isTodOfferingStatusTableEmpty() async {
    final query = db.selectOnly(db.todoOfferingStatuses)
      ..addColumns([db.todoOfferingStatuses.offeringId.count()]);
    final result = await query
        .map((row) => row.read<int>(db.todoOfferingStatuses.offeringId.count()))
        .getSingle();
    return result == 0;
  }
}

@riverpod
TodoOfferingRepository todoOfferingRepo(Ref ref) {
  return TodoOfferingRepository(ref);
}

@riverpod
Future<List<OfferingStatus>> fetchOfferStatus(Ref ref,
    {required RecommendationID id}) {
  final repo = ref.watch(todoOfferingRepoProvider);
  return repo.fetchFilteredOfferingStatus(recommendationId: id);
}

@riverpod
Stream<List<OfferingStatus>> watchTodos(Ref ref) {
  final repo = ref.watch(todoOfferingRepoProvider);
  return repo.watchTodoOfferingStatus();
}
