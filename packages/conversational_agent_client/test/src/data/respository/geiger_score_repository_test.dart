import 'package:conversational_agent_client/src/data/respository/geiger_score_repository.dart';
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

  tearDown(container.dispose);

  group("GeigerScoreRepository....", () {
    test(
        'test calcuation of score using only current profile with score, company name and location ',
        timeout: Timeout(Duration(minutes: 1)), () async {
      final scoreRepo = container.read(geigerScoreRepositoryProvider);
      final userDevice = Asset(type: "desktop", version: "1.1.1", model: "mac");
      final currentProfile = Profile(
          id: "test124",
          actor: Actor(userDevice: userDevice, locale: "en", assets: []),
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
                      status: "recommended"),
                ])
          ]);

      final profile = UserProfileModel(
        currentUserProfile: currentProfile,
      );
      final data = await scoreRepo.fetchGeigerScore(userProfile: profile);
      print("xapi profile object $profile");
      print("geiger score object => $data");
      expect(data, isNotNull);
    });
  });
}
