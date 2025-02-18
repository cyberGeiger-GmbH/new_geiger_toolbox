import 'package:conversational_agent_client/src/data/respository/conversation_repository.dart';
import 'package:conversational_agent_client/src/domain/prompt.dart';
import 'package:conversational_agent_client/src/domain/user_id.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

void main() {
  ProviderContainer getContainer() {
    return ProviderContainer(overrides: [dioProvider.overrideWithValue(Dio())]);
  }

  final container = getContainer();

  tearDownAll(container.dispose);

  test("prompt CA", () async {
    final convRepo = container.read(conversationRepositoryProvider);

    final userID = await convRepo.createUserId();

    expect(userID, isNotNull);

    final prompt = Prompt(
      userID: userID!.userID,
      origin: userID.origin ?? "",
      userMessage: "hello, what is geiger toolbox",
    );

    final message = await convRepo.chatWithCA(prompt: prompt);
    print("prompt => $prompt");
    print("response => $message");
    expect(message, isNotNull);
  });

  test("get chat history", () async {
    const userID = UserID(userID: "ddc013b4-af67-4ee9-b4f4-a2babe77607e");
    final convRepo = container.read(conversationRepositoryProvider);
    final message = await convRepo.getChatHistory(userId: userID);
    print("chat history => $message");
    expect(message, isNotNull);
  });
}
