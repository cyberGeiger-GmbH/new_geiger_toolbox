import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/news_article_log_repository.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_geiger_score_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/previous_user_state_repository.dart';

import 'package:geiger_toolbox/src/utils/device_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "user_profile_model_service.g.dart";

class UserProfileModelService {
  final Ref ref;

  Device get _deviceType => ref.watch(deviceTypeProvider).requireValue;

  Logger get _log => ref.read(logHandlerProvider("UserProfileModelService"));

  UserProfileModelService(this.ref);

  // store current user profile state in local db as previous user profile state
  Future<void> storePreviousUserProfileState() async {
    _log.i("Caching current user profile state");

    final userProfileStateRepo = ref.read(previousUserStateRepoProvider);
    final currentUserProfile = await _fetchCurrentUser();
    _log.i("fetching current user profile");
    await userProfileStateRepo.storeUserProfileState(
        currentUserProfile: currentUserProfile);
    _log.i("DONE Caching current user profile state");
  }

  Future<Profile> _fetchCurrentUser() async {
    final userId = await _userId();

    final compRepo = ref.read(companyProfileRepositoryProvider);
    final scoreRepo = ref.read(localGeigerScoreRepoProvider);

    final companyInfo = await compRepo.fetchCompany();
    final currentNewsState =
        await ref.read(fetchCurrentNewsStateProvider.future);

    final currentUserDevice = Asset(
        type: _deviceType.type.name,
        version: _deviceType.version,
        model: _deviceType.model);

    final score = await scoreRepo.fetchGeigerScore();

    final actor = Actor(
        userDevice: currentUserDevice,
        companyDescription: companyInfo?.description,
        location: companyInfo?.location,
        companyName: companyInfo?.companyName,
        //todo: get locale from device or user profile
        locale: "en",
        assets: [],
        score: "${score?.geigerScore}");
    final currentProfile =
        Profile(id: userId, actor: actor, news: currentNewsState);
    return currentProfile;
  }

  Future<UserProfileModel> fetchUserProfileModel() async {
    final prevProfile = await ref
        .read(previousUserStateRepoProvider)
        .fetchPreviousUserProfile();
    final currentProfile = await _fetchCurrentUser();

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
UserProfileModelService userProfileModelSerivce(Ref ref) {
  return UserProfileModelService(ref);
}
