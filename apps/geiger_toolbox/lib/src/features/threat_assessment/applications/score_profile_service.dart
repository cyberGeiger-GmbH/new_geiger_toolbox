import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/acting_object_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';

import 'package:geiger_toolbox/src/utils/device_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'score_profile_service.g.dart';

class ResultRepository {
  final Ref ref;

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  Logger get _log => ref.read(logHandlerProvider("ScoreProfileService"));

  ResultRepository(this.ref);

  Future<Profile> getProfileForCalculateScore({required bool goodScore}) async {
    _log.i("Preparing profile xapi");
    final userId = await _userId();

    final company = await ref.read(fetchCompanyProvider.future);

    final verb =
        Verb(name: "requesting recalculations base on company profile");

    final object = await ref.read(fetchActingObjectProvider.future);

    final currentUserDeviceInfo = Asset(
        type: _deviceType.type.name,
        version: _deviceType.version,
        model: _deviceType.model);

    final result = await _fetchPreviousScore(success: goodScore);

    
    if (company != null) {
      _log.i("profile with company profile");
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
          verb: verb,
          result: result);
     
    } else {
            _log.i("profile without company profile");
      return Profile.withoutActor(
          id: userId,
          object: object,
          verb: Verb(name: "requesting recalculations without company profile"),
          currentDevice: currentUserDeviceInfo,
          result: result);
    }
  }

  Future<Result?> _fetchPreviousScore({required bool success}) async {
    final repoScore = ref.read(localGeigerScoreRepoProvider);
    final score = await repoScore.fetchGeigerScore();
    if (score != null) {
      final List<String> reasons = [];
      for (var data in score.reasons) {
        reasons.add(data.name);
      }
      final ext = ResultExtensions(
          geigerScore: score.geigerScore,
          lastUpdated: score.lastUpdate,
          reasons: reasons);

      return Result(completions: true, success: success, extensions: ext);
    }
    return null;
  }

  Future<String> _userId() async {
    final user = await ref.read(fetchUserProvider.future);
    final userId = user!.userId;
    return userId;
  }
}

@riverpod
Future<Profile> getScoreProfile(Ref ref, {required bool goodScore}) async {
  final repo = ResultRepository(ref);
  return repo.getProfileForCalculateScore(goodScore: goodScore);
}
