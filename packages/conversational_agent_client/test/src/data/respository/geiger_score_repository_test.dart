import 'package:conversational_agent_client/src/data/respository/geiger_score_repository.dart';
import 'package:conversational_agent_client/src/domain/profile.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  //todo mock client
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

  group("new repository....", () {
    test('news repository using default profile ', () async {
      final container = getContainer();
      final scoreRepo = container.read(geigerScoreRepositoryProvider);
      final userDevice = Asset(type: "desktop", version: "1.1.1", model: "mac");
      final profile = Profile.withDefaultTimestamp(
          id: '',
          actor: Actor(
              userDevice: userDevice,
              assets: [],
              companyName: "testing company"),
          verb: Verb(
              name: "scanning without profile and implemented recommendations"),
          object: ActingObject(definition: [
            Definition(
              id: "new1",
              name: "Threat: APT29 Targets High-Value Victims",
              description:
                  "APT29, a Russia-linked threat actor, uses rogue Remote Desktop Protocol (RDP) servers to target high-value entities like governments and researchers. This threat is significant for users with sensitive data, as it can lead to data leakage and malware installation",
              extensions: [
                DefinitionExtension(
                  recommendationType: "Enable Multi-Factor Authentication",
                  implementations: [
                    Implementation(
                        name: "Microsof",
                        summary:
                            "Provides tools to enable multi-factor authentication for enhanced security.",
                        implemented: false),
                    Implementation(
                        name: "Google",
                        summary:
                            "Offers two-step verification to protect accounts from unauthorized access.",
                        implemented: false),
                  ],
                )
              ],
            ),
          ]),
          result: Result(
              success: false,
              completions: true,
              extensions: ResultExtensions.withDefaultTimestamp(
                  geigerScore: 0, reasons: ["user has not geiger score"]))
          // digitalInfrastructure: DigitalInfrastructure(
          //     infoAbout: ["password", "teamView", "post finance"]),
          );
      final data = await scoreRepo.fetchGeigerScore(profile: profile);
      print("xapi profile object $profile");
      print("geiger score object => $data");
      expect(data, isNotNull);
    });
  });
}
