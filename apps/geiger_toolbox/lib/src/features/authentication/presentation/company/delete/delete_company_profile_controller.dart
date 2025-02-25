import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_description_controller.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'delete_company_profile_controller.g.dart';

@riverpod
class DeleteCompanyProfileController extends _$DeleteCompanyProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> deleteCompleteProfile() async {
    final companyRepo = ref.read(companyProfileRepositoryProvider);
    final compDescription = ref.read(companyDescriptionControllerProvider.notifier);

    state = const AsyncLoading<void>();

    state = await AsyncValue.guard(() async {
      companyRepo.deleteCompanyProfile();
      compDescription.deleteCompanyDescription();
    });
  }
}
