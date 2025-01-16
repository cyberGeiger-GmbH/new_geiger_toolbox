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
    test('news repository using default profile ', () async {
      final container = getContainer();
      final newsRepo = container.read(newsRepositoryProvider);
      final profile = Profile.withDefaultTimestamp(
          id: '',
          actor: Actor(
              companyName: "CyberGEIGER",
              location: "Freiburg, Germany",
              companyDescription: "startup",
              userDevice: Asset(type: "deskpto", version: "1.1.1", model: "mac"),
              assets: []),
          verb: Verb(name: "created user profile on Geiger toolbox")

          // digitalInfrastructure: DigitalInfrastructure(
          //     infoAbout: ["password", "teamView", "post finance"]),
          );
      final data = await newsRepo.fetchNews(profile: profile);
      print("news object => $data");
      expect(data, isNotEmpty);
    });

    test('news repository without profile ', () async {
      final container = getContainer();
      final newsRepo = container.read(newsRepositoryProvider);

      final data = await newsRepo.fetchNews();
      expect(data, isEmpty);
    });
  });



  


}
