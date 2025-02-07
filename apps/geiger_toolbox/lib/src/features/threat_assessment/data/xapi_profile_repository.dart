import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/news_object_log_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';

import 'package:geiger_toolbox/src/utils/device_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "xapi_profile_repository.g.dart";

class XapiProfileRepository {
  final Ref ref;

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  Logger get _log => ref.read(logHandlerProvider("XapiProfileRepository"));

  XapiProfileRepository(this.ref);

  Future<UserProfileModel> getXapiProfile() async {
    _log.i("Preparing profile xapi");
    final userId = await _userId();

    final compRepo = ref.read(companyProfileRepositoryProvider);
    final scoreRepo = ref.read(localGeigerScoreRepoProvider);

    final company = await compRepo.fetchCompany();

    final object = await ref.read(fetchNewsObjectLogProvider.future);

    final currentUserDevice = Asset(
        type: _deviceType.type.name,
        version: _deviceType.version,
        model: _deviceType.model);

    final score = await scoreRepo.fetchGeigerScore();

    final actor = Actor(
        userDevice: currentUserDevice,
        companyDescription: company!.description,
        location: company.location,
        companyName: company.companyName,
        locale: "en",
        assets: [],
        score: score?.geigerScore.toString());

    final currentProfile = Profile(id: userId, actor: actor, news: object);
    return UserProfileModel(currentUserProfile: currentProfile);
  }

  Future<String> _userId() async {
    final user = await ref.read(fetchUserProvider.future);
    final userId = user!.userId;
    return userId;
  }
}

@riverpod
Future<UserProfileModel> getXapiProfile(
  Ref ref,
) async {
  final repo = XapiProfileRepository(ref);
  return repo.getXapiProfile();
}
