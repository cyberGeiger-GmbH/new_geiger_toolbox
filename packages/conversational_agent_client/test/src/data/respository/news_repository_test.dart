import 'package:conversational_agent_client/src/data/respository/news_repository.dart';
import 'package:conversational_agent_client/src/domain/user_profile_model.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  ProviderContainer getContainer() {
    return ProviderContainer(
      overrides: [
        dioProvider.overrideWithValue(Dio()),
      ],
    );
  }

  final container = getContainer();

  tearDownAll(container.dispose);

  group("new repository....", timeout: Timeout(Duration(minutes: 1)), () {
    test(
        'test using only current profile that has NO news, protection, score company and location',
        () async {
      final newsRepo = container.read(newsRepositoryProvider);
      final userDevice = Asset(type: "desktop", version: "1.1.1", model: "mac");

      final currentProfile = Profile(
          id: "test124",
          actor: Actor(userDevice: userDevice, locale: "en", assets: []),
          news: []);

      final profile = UserProfileModel(currentUserProfile: currentProfile);

      final data = await newsRepo.fetchNews(userProfile: profile);
      print("data => $data");
      expect(data, isNotEmpty);
    });

    test('test using current and previous profile ', () async {
      final newsRepo = container.read(newsRepositoryProvider);
      final userDevice = Asset(type: "desktop", version: "1.1.1", model: "mac");

      final currentProfile = Profile(
          id: "test124",
          actor: Actor(
              userDevice: userDevice, locale: "en", score: "20", assets: []),
          news: [
            NewsActicle(
                id: "joint-advisory-warns-of-prc-backed",
                name: "PRC-Backed Cyber Espionage on Telecom",
                description:
                    "A joint advisory warns of cyber espionage by PRC-affiliated actors targeting telecom networks. This threat exploits existing weaknesses, posing risks to user privacy and data security.",
                type: "threat",
                protection: [
                  Protection(
                      name: "Cynet",
                      summary:
                          "Cynet offers an all-in-one cybersecurity platform with 100% detection and protection capabilities.",
                      status: ProtectionStatus.recommended),
                ])
          ]);

      final previousProfile = Profile(
          id: "test124",
          actor: Actor(
              userDevice: userDevice, locale: "en", score: "20", assets: []),
          news: [
            NewsActicle(
                id: "joint-advisory-warns-of-prc-backed",
                name: "PRC-Backed Cyber Espionage on Telecom",
                description:
                    "A joint advisory warns of cyber espionage by PRC-affiliated actors targeting telecom networks. This threat exploits existing weaknesses, posing risks to user privacy and data security.",
                type: "threat",
                protection: [
                  Protection(
                      name: "Cynet",
                      summary:
                          "Cynet offers an all-in-one cybersecurity platform with 100% detection and protection capabilities.",
                      status: ProtectionStatus.planned),
                ])
          ]);
      final userProfile = UserProfileModel(
          currentUserProfile: currentProfile,
          previousUserProfile: previousProfile);

      final data = await newsRepo.fetchNews(userProfile: userProfile);
      //print("news object => $data");
      expect(data, isNotEmpty);
    });

    test('test using only current profile ', () async {
      final newsRepo = container.read(newsRepositoryProvider);
      final userDevice = Asset(type: "desktop", version: "1.1.1", model: "mac");

      final currentProfile = Profile(
          id: "test124",
          actor: Actor(
              userDevice: userDevice, locale: "en", score: "20", assets: []),
          news: [
            NewsActicle(
                id: "joint-advisory-warns-of-prc-backed",
                name: "PRC-Backed Cyber Espionage on Telecom",
                description:
                    "A joint advisory warns of cyber espionage by PRC-affiliated actors targeting telecom networks. This threat exploits existing weaknesses, posing risks to user privacy and data security.",
                type: "threat",
                protection: [
                  Protection(
                      name: "Cynet",
                      summary:
                          "Cynet offers an all-in-one cybersecurity platform with 100% detection and protection capabilities.",
                      status: ProtectionStatus.recommended),
                ])
          ]);

      final profile = UserProfileModel(currentUserProfile: currentProfile);

      final data = await newsRepo.fetchNews(userProfile: profile);
      expect(data, isEmpty);
    });
  });
}
