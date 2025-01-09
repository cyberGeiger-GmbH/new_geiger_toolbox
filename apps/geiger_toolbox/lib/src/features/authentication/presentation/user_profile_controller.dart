import 'package:flutter/foundation.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_controller.g.dart';

@riverpod
class UserProfileController extends _$UserProfileController {
  @override
  FutureOr<void> build() {}

  Future<bool> createProfile({required User user}) async {
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(
        () async => userRepo.createUserProfile(user: user));
    return state.hasError == false;
  }

  Future<bool> updateProfile({required UserData userData}) async {
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard(
      () async =>
          userRepo.updateUserProfile(user: userData.user, userId: userData.id),
    );
    return state.hasError == false;
  }
}


