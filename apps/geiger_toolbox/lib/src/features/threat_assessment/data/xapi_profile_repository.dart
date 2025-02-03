import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/acting_object_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';

import 'package:geiger_toolbox/src/utils/device_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "xapi_profile_repository.g.dart";

class XapiProfileRepository {
  final Ref ref;

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  Logger get _log => ref.read(logHandlerProvider("ScoreProfileService"));

  XapiProfileRepository(this.ref);

  Future<Profile> getXapiProfile({required bool goodScore, Verb? verb}) async {
    _log.i("Preparing profile xapi");
    final userId = await _userId();

    final company = await ref.read(fetchCompanyProvider.future);

    final object = await ref.read(fetchActingObjectProvider.future);

    final currentUserDeviceInfo = Asset(
        type: _deviceType.type.name,
        version: _deviceType.version,
        model: _deviceType.model);

    final result = await _fetchPreviousScore(success: goodScore);

    if (company != null) {
      _log.i("profile with company profile");
      final action =
          Verb(name: "requesting recalculations base on company profile");

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
          verb: verb ?? action,
          result: result);
    } else {
      _log.i("profile without company profile");
      return Profile.withoutActor(
          id: userId,
          object: object,
          verb: verb ??
              Verb(name: "requesting recalculations without company profile"),
          currentDevice: currentUserDeviceInfo,
          result: result);
    }
  }

  Future<List<Result>> _fetchPreviousScore({required bool success}) async {
    final repoScore = ref.read(localGeigerScoreRepoProvider);
    final score = await repoScore.fetchGeigerScoreList();
    final List<Result> result = [];
    if (score.isNotEmpty) {

      for (var data in score) {
       

        if (!result.any((value) => value.id == data.id)) {
          final ext = ResultExtensions(
              geigerScore: data.geigerScore,
              lastUpdated: data.lastUpdate,
              reasons: data.reason);

          result.add(Result(
              success: success,
              completions: true,
              extensions: ext,
              id: data.id));
        }
      }
    }
    return result;
  }

  Future<String> _userId() async {
    final user = await ref.read(fetchUserProvider.future);
    final userId = user!.userId;
    return userId;
  }
}

@riverpod
Future<Profile> getResult(Ref ref,
    {required bool goodScore, Verb? verb}) async {
  final repo = XapiProfileRepository(ref);
  return repo.getXapiProfile(goodScore: goodScore, verb: verb);
}
