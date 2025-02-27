import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering_category.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_offering_repository.g.dart';

typedef RecommendationID = String;

class TodoOfferingRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Logger get _log => ref.read(logHandlerProvider("TodoOfferingRepository"));

  //enum to database
  OfferingStatus todoToOfferingStatus(Status status) => switch (status) {
    Status.recommended => OfferingStatus.recommended,
    Status.planned => OfferingStatus.planned,
    Status.done => OfferingStatus.done,
  };
  //enum from database
  Status offeringToTodoStatus(OfferingStatus? status) => switch (status) {
    OfferingStatus.recommended => Status.recommended,
    OfferingStatus.planned => Status.planned,
    OfferingStatus.done => Status.done,
    _ => Status.recommended,
  };

  TodoOfferingRepository(this.ref);

  //add status of a given offering
  Future<void> addTodo({required TodoOffering todo}) async {
    final todoOffer = TodoOfferingsCompanion(
      offeringId: Value(todo.id),
      offeringStatus: Value(todoToOfferingStatus(todo.status)),
    );

    /// insert or update the todoOffer status
    await _db.into(_db.todoOfferings).insertOnConflictUpdate(todoOffer);
  }

  Future<int> updateTodoStatus({required OfferingId id, required Status status}) async {
    try {
      final todoOffer = TodoOfferingsCompanion(
        offeringId: Value(id),
        offeringStatus: Value(todoToOfferingStatus(status)),
        lastUpdated: Value(DateTime.now()),
      );

      /// update the todoOffer status
      final result = await (_db.update(_db.todoOfferings)..where((t) => t.offeringId.equals(id))).write(todoOffer);
      if (result == 0) {
        throw DataBaseException(output: "No todo offering found");
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  //* add/update status of a given offerings
  Future<void> addListTodo({required List<TodoOffering> offerData}) async {
    // _log.i("add offer to todos $offerData");
    if (offerData.isNotEmpty) {
      await _db.transaction(() async {
        for (var data in offerData) {
          final todoOffer = TodoOfferingsCompanion(
            offeringId: Value(data.id),
            offeringStatus: Value(todoToOfferingStatus(data.status)),
            lastUpdated: Value(DateTime.now()),
          );

          /// insert or update the todoOffer status
          await _db.into(_db.todoOfferings).insertOnConflictUpdate(todoOffer);
        }
      });
    }
  }

  //create a join query that include TodoOfferingStatusesTable and OfferingsTable and recommendations table
  //filter by offering status
  Stream<List<TodoOfferingCategory>> watchTodoOfferingStatus() {
    _log.i("watch List<offeringStatus>");

    final query = _db.select(_db.recommendationOfferings).join([
      leftOuterJoin(_db.todoOfferings, _db.todoOfferings.offeringId.equalsExp(_db.recommendationOfferings.id)),
      leftOuterJoin(
        _db.recommendations,
        _db.recommendations.id.equalsExp(_db.recommendationOfferings.recommendationId),
      ),
    ])..where(
      _db.todoOfferings.offeringId.equalsExp(_db.recommendationOfferings.id) &
          (_db.todoOfferings.offeringStatus.equals(OfferingStatus.planned.index) |
              _db.todoOfferings.offeringStatus.equals(OfferingStatus.done.index)),
    );
    // transform the query stream into a stream of [OfferingStatus] lists
    return query.watch().map((rows) {
      final Map<String, List<TodoOffering>> categoryMap = {};

      for (final row in rows) {
        final recommendationEntry = row.readTable(_db.recommendations);
        final offeringEntry = row.readTable(_db.recommendationOfferings);
        final todoOfferingEntry = row.readTableOrNull(_db.todoOfferings);

        final offering = Offering(name: offeringEntry.name, summary: offeringEntry.summary);
        final status = offeringToTodoStatus(todoOfferingEntry!.offeringStatus);

        final todos = TodoOffering(
          id: offeringEntry.id,
          offering: offering,
          status: status,
          dateRecommendated: offeringEntry.dateRecommendated,
          lastUpdated: todoOfferingEntry.lastUpdated,
        );

        // Group offerings by category name
        categoryMap.putIfAbsent(recommendationEntry.name, () => []).add(todos);
      }

      // Convert the map to list of TodoOfferingCategory
      return categoryMap.entries
          .map((entry) => TodoOfferingCategory(category: entry.key, offerings: entry.value))
          .toList();
    });
  }

  //get offering that has already be added to todos by filtering by recommendation id
  Future<List<TodoOffering>> fetchFilteredOfferingStatus({required String recommendationId}) async {
    //create a join query that include TodoOfferingStatusesTable and OfferingsTable
    final query = _db.select(_db.recommendationOfferings).join([
        leftOuterJoin(_db.todoOfferings, _db.todoOfferings.offeringId.equalsExp(_db.recommendationOfferings.id)),
      ])
      //filter by recommendationID
      ..where(_db.recommendationOfferings.recommendationId.equals(recommendationId));

    final result = await query.get();

    List<TodoOffering> statusList = [];
    for (var row in result) {
      // Read the offerings entry;
      final offeringEntry = row.readTable(_db.recommendationOfferings);
      // Read the todo offering status entry or null if there is no match
      final todoOfferingEntry = row.readTableOrNull(_db.todoOfferings);

      final offering = Offering(name: offeringEntry.name, summary: offeringEntry.summary);

      final status = offeringToTodoStatus(todoOfferingEntry?.offeringStatus);

      statusList.add(
        TodoOffering(
          id: offeringEntry.id,
          offering: offering,
          status: status,
          dateRecommendated: offeringEntry.dateRecommendated,
          lastUpdated: todoOfferingEntry?.lastUpdated,
        ),
      );
    }
    return statusList;
  }

  /// Check if the todo offer Status table is empty
  Future<bool> isTodOfferingStatusTableEmpty() async {
    final query = _db.selectOnly(_db.todoOfferings)..addColumns([_db.todoOfferings.offeringId.count()]);
    final result = await query.map((row) => row.read<int>(_db.todoOfferings.offeringId.count())).getSingle();
    return result == 0;
  }
}

@riverpod
TodoOfferingRepository todoOfferingRepo(Ref ref) {
  return TodoOfferingRepository(ref);
}

@riverpod
Future<List<TodoOffering>> fetchOfferStatus(Ref ref, {required RecommendationID id}) {
  final repo = ref.watch(todoOfferingRepoProvider);
  return repo.fetchFilteredOfferingStatus(recommendationId: id);
}

@riverpod
Stream<List<TodoOfferingCategory>> watchTodos(Ref ref) {
  final repo = ref.watch(todoOfferingRepoProvider);
  return repo.watchTodoOfferingStatus();
}
