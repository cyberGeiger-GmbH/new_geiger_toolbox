import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/acting_object_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/remote/remote_geiger_score_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/geiger_score_info.dart';
import 'package:geiger_toolbox/src/utils/device_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geiger_score_service.g.dart';

class GeigerScoreService {
  final Ref ref;

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  GeigerScoreService(this.ref);

  Future<void> cachedGeigerScore() async {
    final repo = ref.read(localGeigerScoreRepoProvider);
    final profile = await _getProfileForCalculateScore();
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

  Future<Profile> _getProfileForCalculateScore() async {
    final company = await ref.read(fetchCompanyProvider.future);

    final object = await ref.read(fetchActingObjectProvider.future);
    final userId = await _userId();
    final currentUserDeviceInfo = Asset(
        type: _deviceType.type.name,
        version: _deviceType.version,
        model: _deviceType.model);
    if (company != null) {
      return Profile.withDefaultTimestamp(
          id: userId,
          actor: Actor(
            companyName: company.companyName,
            location: company.location,
            companyDescription: company.description,
            userDevice: currentUserDeviceInfo,
            assets: [],
          ),
          object: object,
          verb: Verb(name: "User profile created"));
    } else {
      return Profile.withoutActor(
        id: userId,
        object: object,
        verb: Verb(name: "initial scan without company profile"),
        currentDevice: currentUserDeviceInfo,
      );
    }
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
