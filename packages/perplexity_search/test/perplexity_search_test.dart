import 'package:dio/dio.dart';
import 'package:perplexity_search/env/env.dart';
import 'package:perplexity_search/perplexity_search.dart';
import 'package:perplexity_search/src/utilities/dio_client.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  ProviderContainer getContainer({Dio? client}) {
    final container =
        client != null
            ? ProviderContainer(overrides: [dioClientProvider.overrideWithValue(client)])
            : ProviderContainer();
    addTearDown(container.dispose);

    return container;
  }

  test('search company details', () async {
    final container = getContainer();
    final repo = container.read(perplexitySearchRepositoryProvider);

    final data = await repo.searchCompanyDescription(
      companyName: "cyberGeiger",
      location: "Freiburg",
      apiKey: Env.perplexityApiKey,
    );

    print("result => $data");

    expect(data, isNotNull);
  });
}
