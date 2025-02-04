import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_offering_repository.g.dart';

typedef RecommendationID = String;

class TodoOfferingRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Logger get _log => ref.read(logHandlerProvider("TodoOfferingRepository"));
  TodoOfferingRepository(this.ref);

  //add/update status of a given offering
  Future<void> addOrUpdateTodoOfferingStatus(
      {required OfferingId id, required bool isAdded}) async {
    final offeringStatus = TodoOfferingsCompanion(
      offeringId: Value(id),
      added: Value(isAdded),
    );

    /// insert or update the todoOffer status
    await _db.into(_db.todoOfferings).insertOnConflictUpdate(offeringStatus);
  }

  //* add/update status of a given offerings
  Future<void> addOrUpdateTodoOfferings(
      {required List<TodoOffing> offerData}) async {
    _log.i("add offer to todos $offerData");
    if (offerData.isNotEmpty) {
      await _db.transaction(() async {
        for (var data in offerData) {
          final offeringStatus = TodoOfferingsCompanion(
            offeringId: Value(data.id),
            added: Value(data.added),
          );

          /// insert or update the todoOffer status
          await _db
              .into(_db.todoOfferings)
              .insertOnConflictUpdate(offeringStatus);
        }
      });
    }
  }

  // * todo state

  // Future<void> updateStatusTodo({required TodoOffing todo}) async {
  //   final offeringStatus = StatusTodoOfferingsCompanion(
  //     offeringId: Value(todo.id),
  //     added: Value(todo.added),
  //   );

  //   /// insert or update the todoOffer status
  //   await _db
  //       .into(_db.todoOfferingStatuses)
  //       .insertOnConflictUpdate(offeringStatus);
  // }

  //Get all Offers that has be added to the todoOfferingStatus
  Stream<List<TodoOffing>> watchTodoOfferingStatus() {
    _log.i("watch List<offeringStatus>");
    //create a join query that include TodoOfferingStatusesTable and OfferingsTable
    final query = _db.select(_db.recommendationOfferings).join(
      [
        leftOuterJoin(
          _db.todoOfferings,
          _db.todoOfferings.offeringId
              .equalsExp(_db.recommendationOfferings.id),
        ),
      ],
      //filter by offerings id
    )..where(
        _db.todoOfferings.offeringId.equalsExp(_db.recommendationOfferings.id));
    // transform the query stream into a stream of [OfferingStatus] lists
    return query.watch().map((rows) {
      return rows.map((row) {
        // Read the offerings entry;
        final offeringEntry = row.readTable(_db.recommendationOfferings);
        // Read the todo offering status entry or null if there is no match
        final todoOfferingStatus = row.readTableOrNull(_db.todoOfferings);

        final offering =
            Offering(name: offeringEntry.name, summary: offeringEntry.summary);

        return TodoOffing(
            offering: offering,
            id: todoOfferingStatus!.offeringId,
            added: todoOfferingStatus.added,
            datePlanned: todoOfferingStatus.datePlanned);
      }).toList();
    });
  }

  //get offering that has already be added to todos by filtering by recommendation id
  Future<List<TodoOffing>> fetchFilteredOfferingStatus(
      {required String recommendationId}) async {
    //create a join query that include TodoOfferingStatusesTable and OfferingsTable
    final query = _db.select(_db.recommendationOfferings).join([
      leftOuterJoin(
          _db.todoOfferings,
          _db.todoOfferings.offeringId
              .equalsExp(_db.recommendationOfferings.id))
    ])
      //filter by recommendationID
      ..where(_db.recommendationOfferings.recommendationId
          .equals(recommendationId));
    final result = await query.get();
    List<TodoOffing> statusList = [];
    for (var row in result) {
      // Read the offerings entry;
      final offeringEntry = row.readTable(_db.recommendationOfferings);
      // Read the todo offering status entry or null if there is no match
      final todoOfferingStatus = row.readTableOrNull(_db.todoOfferings);
      final offering =
          Offering(name: offeringEntry.name, summary: offeringEntry.summary);

      statusList.add(TodoOffing(
          id: offeringEntry.id,
          offering: offering,
          added: todoOfferingStatus?.added ?? false));
    }
    return statusList;
  }

  /// Check if the todo offer Status table is empty
  Future<bool> isTodOfferingStatusTableEmpty() async {
    final query = _db.selectOnly(_db.todoOfferings)
      ..addColumns([_db.todoOfferings.offeringId.count()]);
    final result = await query
        .map((row) => row.read<int>(_db.todoOfferings.offeringId.count()))
        .getSingle();
    return result == 0;
  }
}

@riverpod
TodoOfferingRepository todoOfferingRepo(Ref ref) {
  return TodoOfferingRepository(ref);
}

@riverpod
Future<List<TodoOffing>> fetchOfferStatus(Ref ref,
    {required RecommendationID id}) {
  final repo = ref.watch(todoOfferingRepoProvider);
  return repo.fetchFilteredOfferingStatus(recommendationId: id);
}

@riverpod
Stream<List<TodoOffing>> watchTodos(Ref ref) {
  final repo = ref.watch(todoOfferingRepoProvider);
  return repo.watchTodoOfferingStatus();
}
