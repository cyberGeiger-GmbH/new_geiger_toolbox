import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/news_article_log_repository.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/user_profile_model_repository.dart';

import 'package:geiger_toolbox/src/utils/device_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "user_profile_model_service.g.dart";

class UserProfileModelService {
  final Ref ref;

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  Logger get _log => ref.read(logHandlerProvider("XapiProfileRepository"));

  UserProfileModelService(this.ref);

  Future<Profile> fetchCurrentUser() async {
    final userId = await _userId();

    final compRepo = ref.read(companyProfileRepositoryProvider);
    final scoreRepo = ref.read(localGeigerScoreRepoProvider);

    final company = await compRepo.fetchCompany();
    final object = await ref.read(fetchNewsArticleProvider.future);
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
        score: "${score?.geigerScore}");
    final currentProfile = Profile(id: userId, actor: actor, news: object);
    return currentProfile;
  }

  Future<UserProfileModel> fetchUserProfileModel() async {
    _log.i("Preparing profile xapi");

    final prevProfile = await ref
        .read(userProfileModelRepositoryProvider)
        .fetchPreviousUserProfile();
    final currentProfile = await fetchCurrentUser();

    return UserProfileModel(
        currentUserProfile: currentProfile, previousUserProfile: prevProfile);
  }

  Future<String> _userId() async {
    final user = await ref.read(fetchUserProvider.future);
    final userId = user!.userId;
    return userId;
  }
}

@riverpod
UserProfileModelService userProfileSerivce(Ref ref) {
  return UserProfileModelService(ref);
}
