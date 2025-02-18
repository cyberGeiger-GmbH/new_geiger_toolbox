import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/env.dart';
import 'package:perplexity_search/perplexity_search.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'perplexity_repository.g.dart';

class PerplexityRepository {
  final Ref ref;
  PerplexityRepository(this.ref);

  Future<String?> getCompanyDescription({required String companyName, required String location}) async {
    final repo = ref.read(perplexitySearchRepositoryProvider);
    final apiKey = Env.perplexityApiToken;
    //debugPrint("perplexity api_key $apiKey");
    final data = await repo.searchCompanyDescription(companyName: companyName, location: location, apiKey: apiKey);
    return data?.description;
  }
}

@riverpod
PerplexityRepository perplexityRepository(Ref ref) {
  return PerplexityRepository(ref);
}
