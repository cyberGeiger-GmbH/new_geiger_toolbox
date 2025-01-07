import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_controller.g.dart';

@riverpod
class UserProfileController extends _$UserProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> createProfile({required User user}) async {
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(
        () async => userRepo.createUserProfile(user: user));
  }
}
