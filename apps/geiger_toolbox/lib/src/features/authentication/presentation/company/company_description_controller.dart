import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/perplexity_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'company_description_controller.g.dart';

@riverpod
class CompanyDescriptionController extends _$CompanyDescriptionController {
  @override
  Future<String?> build() async {
    return null;
  }

  Future<void> setCompanyDescription(
      {required String companyName, required String location}) async {
    final perplexityRepo = ref.read(perplexityRepositoryProvider);
    state = AsyncLoading<String>();
    state = await AsyncValue.guard(() => perplexityRepo.getCompanyDescription(
        companyName: companyName, location: location));
  }
}

@riverpod
Future<String?> getCompanyDescription(Ref ref) async {
  final remoteData =
      await ref.watch(companyDescriptionControllerProvider.future);
  final cache = await ref.watch(watchCompanyProvider.future);
  if (remoteData != null) {
    return remoteData;
  } else {
    if (cache != null) {
      return cache.description;
    }
  }
  return null;
}
