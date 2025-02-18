import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_profile_controller.g.dart';

@riverpod
class CompanyProfileController extends _$CompanyProfileController {
  @override
  FutureOr<void> build() {}

  Future<bool> createCompanyProfile({required Company company}) async {
    final companyRepo = ref.read(companyProfileRepositoryProvider);
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    final userId = await userRepo.fetchUser();
    state = await AsyncValue.guard(
      () async => companyRepo.createCompanyProfile(companyInfo: company, userId: userId!.userId),
    );
    return state.hasError == false;
  }

  Future<bool> updateCompanyProfile({required Company company}) async {
    final companyRepo = ref.read(companyProfileRepositoryProvider);
    final userRepo = ref.read(userProfileRepositoryProvider);
    state = const AsyncLoading<void>();
    final userId = await userRepo.fetchUser();
    state = await AsyncValue.guard(
      () async => companyRepo.updateCompanyProfile(companyInfo: company, userId: userId!.userId),
    );
    return state.hasError == false;
  }
}
