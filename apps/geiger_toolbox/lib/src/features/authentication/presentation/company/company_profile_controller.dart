import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';
import 'package:geiger_toolbox/src/mixin/notifier_mounted.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_profile_controller.g.dart';

enum CompanyStatus { updated, created }

@riverpod
class CompanyProfileController extends _$CompanyProfileController with NotifierMounted {
  @override
  FutureOr<CompanyStatus?> build() {
    ref.onDispose(() {
      setUnmounted();
    });
    return null;
  }

  Future<void> createCompanyProfile({required Company company, required void Function() onSuccess}) async {
    final companyRepo = ref.read(companyProfileRepositoryProvider);
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    final userId = await userRepo.fetchUser();
    final newState = await AsyncValue.guard(() async {
      final result = await companyRepo.createCompanyProfile(companyInfo: company, userId: userId!.userId);
      return result != 0 ? CompanyStatus.created : null;
    });
    //for testing purpose
    // final newState = await AsyncValue.guard(() => Future.delayed(const Duration(seconds: 5)));

    if (mounted) {
      // * only set the state if the controller hasn't been disposed
      state = newState;
      if (state.hasError == false) {
        onSuccess();
      }
    }
  }

  Future<void> updateCompanyProfile({required Company company, required void Function() onSuccess}) async {
    final companyRepo = ref.read(companyProfileRepositoryProvider);
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    final userId = await userRepo.fetchUser();
    //for testing purpose
    // final newState = await AsyncValue.guard(() => Future.delayed(const Duration(seconds: 5)));
    final newState = await AsyncValue.guard(() async {
      final result = await companyRepo.updateCompanyProfile(companyInfo: company, userId: userId!.userId);
      return result ? CompanyStatus.updated : null;
    });
    if (mounted) {
      state = newState;
      if (newState.hasError == false) {
        onSuccess();
      }
    }
  }
}
