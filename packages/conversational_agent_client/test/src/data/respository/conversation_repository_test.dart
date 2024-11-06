import 'dart:math';

import 'package:conversational_agent_client/src/data/respository/conversation_repository.dart';
import 'package:conversational_agent_client/src/domain/prompt.dart';
import 'package:conversational_agent_client/src/domain/user_id.dart';
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

  group("conversation repository ...", () {
    test('create userId', () async {
      final container = getContainer();
      final converRepo = container.read(conversationRepositoryProvider);
      final userId = await converRepo.createUserId();
      expect(userId, isNotNull);
      //eb38fecf-c097-4e8a-aea5-dd6953459f11
    });

    test("prompt CA", () async {
      const userID = UserID(userID: "eb38fecf-c097-4e8a-aea5-dd6953459f11");
      final prompt = Prompt(
          userID: userID, userMessage: "hello, I have just test this endpoint");
      final container = getContainer();
      final convRepo = container.read(conversationRepositoryProvider);
      final message = await convRepo.chatWithCA(prompt: prompt);
      print("response => $message");
      expect(message, isNotNull);
    });
  });
}
