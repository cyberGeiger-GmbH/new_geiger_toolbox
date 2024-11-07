import 'package:conversational_agent_client/src/data/respository/news_repository.dart';
import 'package:conversational_agent_client/src/domain/profile.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  //todo mock client
  //late Dio client;
  ProviderContainer getContainer({Dio? client}) {
    final container = client != null
        ? ProviderContainer(
            overrides: [
              dioProvider.overrideWithValue(client),
            ],
          )
        : ProviderContainer();
    addTearDown(container.dispose);
    return container;
  }

  // setUp(() {
  //   client = Dio();
  // });

  group("new repository....", () {
    test('news repository using default client passing profile ', () async {
      final container = getContainer();
      final newsRepo = container.read(newsRepositoryProvider);
      final profile = Profile(platform: "ios", smeCategory: "small Ict assets");
      final data = await newsRepo.fetchNews(profile: profile);
      print("data with profile =$profile => news object => $data");
    });

    test(
        'news repository using default client passing without profile passing profile ',
        () async {
      final container = getContainer();
      final newsRepo = container.read(newsRepositoryProvider);

      final data = await newsRepo.fetchNews();
      print("data without profile => $data");
    });
  });
}
