import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'delete_profile_controller.g.dart';

@riverpod
class DeleteProfileController extends _$DeleteProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> deleteProfile() async {
    final userRepo = ref.read(userProfileRepositoryProvider);

    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() async => userRepo.deleteProfile());
  }
}
