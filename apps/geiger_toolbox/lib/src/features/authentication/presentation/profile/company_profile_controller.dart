import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/perplexity_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'company_profile_controller.g.dart';

@riverpod
class CompanyProfileController extends _$CompanyProfileController {
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
  final remoteData = await ref.watch(companyProfileControllerProvider.future);
  final cache = await ref.watch(watchUserProvider.future);
  if (remoteData != null) {
    return remoteData;
  } else {
    if (cache != null) {
      return cache.user.description;
    }
  }
  return null;
}
