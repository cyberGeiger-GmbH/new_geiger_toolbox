import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_profile_controller.g.dart';

@riverpod
class CompanyProfileController extends _$CompanyProfileController with NotifierMounted {
  @override
  FutureOr<void> build() {
    ref.onDispose(() {
      setUnmounted();
    });
  }

  Future<void> createCompanyProfile({required Company company}) async {
    final companyRepo = ref.read(companyProfileRepositoryProvider);
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    final userId = await userRepo.fetchUser();
    final newState = await AsyncValue.guard(
      () async => companyRepo.createCompanyProfile(companyInfo: company, userId: userId!.userId),
    );
    //for testing purpose
    // final newState = await AsyncValue.guard(() => Future.delayed(const Duration(seconds: 5)));

    if (mounted) {
      state = newState;
      if (newState.hasError == false) {
        // get the GoRouter instance and call pop on it
        ref.read(goRouterProvider).pop();
      }
    }
  }

  Future<void> updateCompanyProfile({required Company company}) async {
    final companyRepo = ref.read(companyProfileRepositoryProvider);
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    final userId = await userRepo.fetchUser();
    //for testing purpose
    // final newState = await AsyncValue.guard(() => Future.delayed(const Duration(seconds: 5)));
    final newState = await AsyncValue.guard(
      () async => companyRepo.updateCompanyProfile(companyInfo: company, userId: userId!.userId),
    );
    if (mounted) {
      state = newState;
      if (newState.hasError == false) {
        // get the GoRouter instance and call pop on it
        ref.read(goRouterProvider).pop();
      }
    }
  }
}

mixin NotifierMounted {
  bool _mounted = true;

  void setUnmounted() => _mounted = false;

  bool get mounted => _mounted;
}
