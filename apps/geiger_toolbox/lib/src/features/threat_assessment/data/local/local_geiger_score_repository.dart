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

  //create score
  Future<void> storeGeigerScore(
      {required GeigerScore score, required UserID userId}) async {
    await _db.transaction(() async {
      final geigerData = GeigerScoresCompanion(
        score: Value(score.geigerScore),
        userId: Value(userId),
      );
      final scoreId = await _db.into(_db.geigerScores).insert(geigerData);

      if (score.reasons.isNotEmpty) {
        for (var reason in score.reasons) {
          final data =
              ReasonsCompanion(reason: Value(reason), scoreId: Value(scoreId));
          await _db.into(_db.reasons).insert(data);
        }
      }
    });
  }

  Stream<GeigerScoreInfo?> watchGeigerScore() {
    final query = (_db.select(_db.geigerScores).join([
      leftOuterJoin(
        _db.reasons,
        _db.reasons.scoreId.equalsExp(_db.geigerScores.id),
      )
    ])
          ..orderBy([
            OrderingTerm.desc(
              _db.geigerScores.lastUpdated,
            )
          ])
          ..limit(1))
        .watchSingleOrNull(); //only fetch the most recent update

    final List<ScoreReason> reasons = [];

    return query.map((row) {
      if (row != null) {
        final scoreEntry = row.readTable(_db.geigerScores);
        final reasonEntry = row.readTableOrNull(_db.reasons);
        if (reasonEntry != null) {
          // if the reasons  is not yet in the list add it
          if (!reasons.any((value) => value.scoreId == scoreEntry.id)) {
            reasons.add(ScoreReason(
                scoreId: reasonEntry.scoreId, name: reasonEntry.reason));
          }
        }
        return GeigerScoreInfo(
            id: scoreEntry.id,
            geigerScore: scoreEntry.score,
            lastUpdate: scoreEntry.lastUpdated,
            reasons: reasons);
      }
      return null;
    });
  }

  Future<GeigerScoreInfo?> fetchGeigerScore() async {
    final query = await (_db.select(_db.geigerScores).join([
      leftOuterJoin(
        _db.reasons,
        _db.reasons.scoreId.equalsExp(_db.geigerScores.id),
      )
    ])
          ..orderBy([
            OrderingTerm.desc(
              _db.geigerScores.lastUpdated,
            )
          ])
          ..limit(1))
        .getSingleOrNull(); //only fetch the most recent update

    final List<ScoreReason> reasons = [];

    if (query != null) {
      final scoreEntry = query.readTable(_db.geigerScores);
      final reasonEntry = query.readTableOrNull(_db.reasons);
      if (reasonEntry != null) {
        // if the reasons  is not yet in the list add it
        if (!reasons.any((value) => value.scoreId == scoreEntry.id)) {
          reasons.add(ScoreReason(
              scoreId: reasonEntry.scoreId, name: reasonEntry.reason));
        }
      }
      return GeigerScoreInfo(
          id: scoreEntry.id,
          geigerScore: scoreEntry.score,
          lastUpdate: scoreEntry.lastUpdated,
          reasons: reasons);
    }
    return null;
  }

  Stream<List<GeigerScoreInfo>> watchGeigerScoreList() {
    final query = _db.select(_db.geigerScores).join(
      [
        leftOuterJoin(
          _db.reasons,
          _db.reasons.scoreId.equalsExp(_db.geigerScores.id),
        )
      ],
    )..orderBy([
        OrderingTerm.desc(
          _db.geigerScores.lastUpdated,
        )
      ]); //only fetch the most recent update

    final List<ScoreReason> reasons = [];

    return query.watch().map((rows) {
      return rows.map((row) {
        final scoreEntry = row.readTable(_db.geigerScores);
        final reasonEntry = row.readTableOrNull(_db.reasons);

        if (reasonEntry != null) {
          if (!reasons.any((value) => value.scoreId == scoreEntry.id)) {
            reasons.add(ScoreReason(
                scoreId: reasonEntry.scoreId, name: reasonEntry.reason));
          }
        }

        return GeigerScoreInfo(
            id: scoreEntry.id,
            geigerScore: scoreEntry.score,
            lastUpdate: scoreEntry.lastUpdated,
            reasons: reasons);
      }).toList();
    });
  }
}

@riverpod
LocalGeigerScoreRepository localGeigerScoreRepo(Ref ref) {
  return LocalGeigerScoreRepository(ref);
}
