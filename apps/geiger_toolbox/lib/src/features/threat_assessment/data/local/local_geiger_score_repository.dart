import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/geiger_score_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'local_geiger_score_repository.g.dart';

class LocalGeigerScoreRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);
  LocalGeigerScoreRepository(this.ref);

  Logger get _log => ref.read(logHandlerProvider("LocalGeigerScoreRepository"));

  //create score
  Future<void> storeGeigerScore(
      {required GeigerScore score, required UserID userId}) async {
    try {
      _log.i("storing geigerScore .. ");
      await _db.transaction(() async {
        final geigerData = GeigerScoresCompanion(
          score: Value(score.geigerScore),
          userId: Value(userId),
          reason: Value(score.reasons),
        );
        await _db.into(_db.geigerScores).insert(geigerData);
      });
    } catch (e) {
      _log.e(e);
      rethrow;
    }
  }

  Stream<GeigerScoreInfo?> watchGeigerScore() {
    _log.i("watching GeigerScore...");
    final query = (_db.select(_db.geigerScores)
          ..orderBy([
            (n) => OrderingTerm.desc(
                  n.lastUpdated,
                )
          ])
          ..limit(1))
        .watchSingleOrNull(); //only fetch the most recent update

    return query.map((row) {
      if (row != null) {
        return GeigerScoreInfo(
            id: row.id,
            geigerScore: row.score,
            lastUpdate: row.lastUpdated,
            reason: row.reason);
      }
      return null;
    });
  }

  Future<GeigerScoreInfo?> fetchGeigerScore() async {
    _log.i("fetching GeigerScore...");
    final query = await (_db.select(_db.geigerScores)
          ..orderBy([
            (n) => OrderingTerm.desc(
                  n.lastUpdated,
                )
          ])
          ..limit(1))
        .getSingleOrNull(); //only fetch the most recent update

    if (query != null) {
      // if the reasons  is not yet in the list add it

      return GeigerScoreInfo(
          id: query.id,
          geigerScore: query.score,
          lastUpdate: query.lastUpdated,
          reason: query.reason);
    }
    return null;
  }

  Stream<List<GeigerScoreInfo>> watchGeigerScoreList() {
    _log.i("watching List<GeigerScore>...");
    final query = _db.select(_db.geigerScores)
      ..orderBy([
        (n) => OrderingTerm.desc(
              n.lastUpdated,
            )
      ]); //only fetch the most recent update

    return query.watch().map((rows) {
      return rows.map((row) {
        return GeigerScoreInfo(
            id: row.id,
            geigerScore: row.score,
            lastUpdate: row.lastUpdated,
            reason: row.reason);
      }).toList();
    });
  }

  Future<List<GeigerScoreInfo>> fetchGeigerScoreList() async {
    _log.i("fechting List<GeigerScore>...");
    final query = await (_db.select(_db.geigerScores)
          ..orderBy([
            (n) => OrderingTerm.desc(
                  n.lastUpdated,
                )
          ]))
        .get(); //only fetch the most recent update

    final List<GeigerScoreInfo> scoreList = [];
    for (var row in query) {
      if (!scoreList.any((value) => value.id == row.id)) {
        final data = GeigerScoreInfo(
            id: row.id,
            geigerScore: row.score,
            lastUpdate: row.lastUpdated,
            reason: row.reason);
        scoreList.add(data);
      }
    }
    return scoreList;
  }
}

@riverpod
LocalGeigerScoreRepository localGeigerScoreRepo(Ref ref) {
  return LocalGeigerScoreRepository(ref);
}
