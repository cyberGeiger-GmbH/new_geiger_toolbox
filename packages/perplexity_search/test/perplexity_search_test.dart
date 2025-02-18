import 'package:dio/dio.dart';
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
    final testAPi = "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";

    final data = await repo.searchCompanyDescription(companyName: "cyberGeiger", location: "Freiburg", apiKey: testAPi);

    print("result => $data");

    expect(data, isNotNull);
  });
}
