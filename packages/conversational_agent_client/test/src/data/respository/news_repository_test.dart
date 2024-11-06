import 'package:conversational_agent_client/src/data/respository/news_repository.dart';
import 'package:conversational_agent_client/src/data/respository/profile.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  late Dio client;
  ProviderContainer getContainer(Dio client) {
    final container = ProviderContainer(
      overrides: [
        dioProvider.overrideWithValue(client),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    client = Dio();
  });

  group("new repository....", () {
    test('news repository  passing profile ', () async {
      final container = getContainer(client);
      final newsRepo = container.read(newsRepositoryProvider);
      final profile = Profile(platform: "ios", smeCategory: "hair saloon");
      final data = await newsRepo.fetchNews(profile: profile);
      print("data with profile =$profile => $data");
    });

    test('news repository  passing profile ', () async {
      final container = getContainer(client);
      final newsRepo = container.read(newsRepositoryProvider);

      final data = await newsRepo.fetchNews();
      print("data without profile => $data");
    });
  });
}
