import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final repo = ref.read(localGeigerScoreRepoProvider);

//todo: check the range of score and update the goodScore parameter
    final profile =
        await ref.read(getScoreProfileProvider(goodScore: false).future);

    debugPrint("sending xapi profile to getScore => ${profile.result}");

    final geigerScore =
        await ref.read(getGeigerScoreProvider(userProfile: profile).future);
    if (geigerScore != null) {
      repo.storeGeigerScore(score: geigerScore, userId: await _userId());
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
