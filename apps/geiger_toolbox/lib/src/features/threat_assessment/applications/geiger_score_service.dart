import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';

import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/score_profile_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/remote/remote_geiger_score_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/geiger_score_info.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geiger_score_service.g.dart';

class GeigerScoreService {
  final Ref ref;

  GeigerScoreService(this.ref);

  Future<void> cachedGeigerScore() async {
    final log = ref.read(logHandlerProvider("GeigerScore"));
    try {
      log.i("Calculation has started...");
      final repo = ref.read(localGeigerScoreRepoProvider);

//todo: check the range of score and update the goodScore parameter
      final previousScoreProfile =
          await ref.read(getScoreProfileProvider(goodScore: false).future);

      log.i(
          "sending company profile in xapi format}");

      final geigerScore = await ref.read(
          getGeigerScoreProvider(userProfile: previousScoreProfile).future);
      log.i("Received Score from Server");
      if (geigerScore != null) {
        log.i("Storing score locally}");
        repo.storeGeigerScore(score: geigerScore, userId: await _userId());
        log.i("store successfuly stored}");
      }
    } catch (e, s) {
      ref.read(appLoggerProvider).logError(e, s);
      log.e("error encountered: $e");
      rethrow;
    }
  }

  Future<String> _userId() async {
    final user = await ref.read(fetchUserProvider.future);
    final userId = user!.userId;
    return userId;
  }
}

@riverpod
GeigerScoreService geigerScoreService(Ref ref) {
  return GeigerScoreService(ref);
}

@riverpod
Stream<GeigerScoreInfo?> watchGeigerScore(Ref ref) {
  final localscoreRepos = ref.watch(localGeigerScoreRepoProvider);
  return localscoreRepos.watchGeigerScore();
}

@riverpod
Stream<List<GeigerScoreInfo?>> watchGeigerScoreList(Ref ref) {
  final localscoreRepos = ref.watch(localGeigerScoreRepoProvider);
  return localscoreRepos.watchGeigerScoreList();
}

@riverpod
Future<GeigerScoreInfo?> watchNewsFeedByTitle(Ref ref) {
  final localscoreRepos = ref.watch(localGeigerScoreRepoProvider);
  return localscoreRepos.fetchGeigerScore();
}
