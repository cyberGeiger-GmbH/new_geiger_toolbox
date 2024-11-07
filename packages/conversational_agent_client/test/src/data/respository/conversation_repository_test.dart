
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

  test('create userId', () async {
    final container = getContainer();
    final converRepo = container.read(conversationRepositoryProvider);
    final userId = await converRepo.createUserId();
    expect(userId, isNotNull);
  });
  test("prompt CA", () async {
    const userID = UserID(userID: "eb38fecf-c097-4e8a-aea5-dd6953459f11");
    final prompt = Prompt(
        userID: userID.userID,
        origin: userID.origin!,
        userMessage: "hello, what is geiger toolbox");
    final container = getContainer();
    final convRepo = container.read(conversationRepositoryProvider);
    final message = await convRepo.chatWithCA(prompt: prompt);
    print("prompt => $prompt");
    print("response => $message");
    expect(message, isNotNull);
  });

  test("get chat history", () async {
    const userID = UserID(userID: "eb38fecf-c097-4e8a-aea5-dd6953459f11");

    final container = getContainer();
    final convRepo = container.read(conversationRepositoryProvider);
    final message = await convRepo.getChatHistory(userId: userID);
    print("chat history => $message");
    expect(message, isNotNull);
  });
}
