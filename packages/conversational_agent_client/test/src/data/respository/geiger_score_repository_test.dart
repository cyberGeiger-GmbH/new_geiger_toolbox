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
      final profile = Profile.withNoCompanyProfile(
          id: '',
          verb: Verb(name: "scanning without profile and implemented recommendations"),
          object: Acting(definition: [
            Definition(
              id: "new1",
              name: "Threat: APT29 Targets High-Value Victims",
              description:
                  "APT29, a Russia-linked threat actor, uses rogue Remote Desktop Protocol (RDP) servers to target high-value entities like governments and researchers. This threat is significant for users with sensitive data, as it can lead to data leakage and malware installation",
              type: "Enable Multi-Factor Authentication",
              extensions: [
                DefinitionExtension(
                    name: "Microsoft",
                    summary:
                        "Provides tools to enable multi-factor authentication for enhanced security.",
                    alreadyImplemented: false),
                     DefinitionExtension(
                    name: "Google",
                    summary:
                        "Offers two-step verification to protect accounts from unauthorized access.",
                    alreadyImplemented: false),
              ],
            ),
          ]),
          result: Result(
              success: false,
              completions: true,
              extensions: ResultExtensions.withDefaultTimestamp(
                  geigerScore: "user does not have a score",
                  reasons: ["profile has not be created yet by the user"]))
          // digitalInfrastructure: DigitalInfrastructure(
          //     infoAbout: ["password", "teamView", "post finance"]),
          );
      final data = await scoreRepo.fetchGeigerScore(profile: profile);
      print("geiger score object => $data");
      expect(data, isNotNull);
    });
  });
}
