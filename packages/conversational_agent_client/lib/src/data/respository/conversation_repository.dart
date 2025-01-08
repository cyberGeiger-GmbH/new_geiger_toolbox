library conversational_agent_client;

import 'dart:convert';

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:conversational_agent_client/src/domain/conversation.dart';
import 'package:conversational_agent_client/src/domain/message.dart';
import 'package:conversational_agent_client/src/domain/prompt.dart';
import 'package:conversational_agent_client/src/domain/user_id.dart';
import 'package:conversational_agent_client/src/utilities/constants/base.dart';
import 'package:conversational_agent_client/src/utilities/extensions/response_extension.dart';

import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversation_repository.g.dart';

class ConversationRepository {
  final Ref ref;
  ConversationRepository(this.ref);

  ///create userId before starting conversational using Post request
  ///send origin
  ///return [UserID]
  Future<UserID?> createUserId() async {
    final client = ref.read(dioProvider);
    final log = ref.read(logHandlerProvider("CreateUserId"));

    try {
      final Uri uri = Uri.https(
        Base.url,
        Base.createThreadPath,
      );
      final Response response = await client.postUri(
        uri,
        data: Base.origin,
        options: Options(headers: Base.headers),
      );

      return response.userIdParser(ref);
    } catch (e, s) {
      log.e("err => $e, stack => $s");

      return null;
    }
  }

  ///get userID
  ///[UserID] as parameter
  ///if not found return new [UserID]
  // Future<UserID> getUserId({required UserID userid}) async {

  // }

  ///start conversational
  ///send [Prompt] as body using a Post request
  ///return [Message]
  Future<Message?> chatWithCA({required Prompt prompt}) async {
    final client = ref.read(dioProvider);
    final log = ref.read(logHandlerProvider("ChatWithCA"));

    try {
      final Uri uri = Uri.https(
        Base.url,
        Base.chatPath,
      );
      final Response response = await client.postUri(
        uri,
        data: json.encode(prompt),
        options: Options(headers: Base.headers),
      );

      return response.messageParser(ref);
    } catch (e, s) {
      log.e("err => $e, stack => $s");

      return null;
    }
  }

  ///retrieve [List<Message>] previous conversation thread using Get request
  ///send [UserID] as queryParma
  /// return null if [UserNotFound] is found
  Future<List<Message>?> getChatHistory({required UserID userId}) async {
    Set<Message> messages = {};
    final log = ref.read(logHandlerProvider("getChatHistory"));

    try {
      final client = ref.read(dioProvider);

      // get user, create one when null
      final Uri uri = Uri.https(Base.url, Base.chatHistory, userId.toJson());
      final Response response = await client.getUri(uri);
      final List<Conversation> conversations = response.conversationParser(ref);
//remap
      for (var data in conversations) {
        final Message message = Message(
            message: data.content.first.text.value.message,
            role: data.role == Role.user.value ? Role.user : Role.assistant,
            id: data.id,
            createdAt: DateTime(data.createdAt));
        messages.add(message);
      }

      return messages.toList();
    } catch (e, s) {
      log.e("err => $e, stack => $s");

      return null;
    }
  }
}

@riverpod
ConversationRepository conversationRepository(Ref ref) {
  return ConversationRepository(ref);
}
