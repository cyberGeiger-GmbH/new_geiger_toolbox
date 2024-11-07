library conversational_agent_client;

import 'dart:convert';

import 'package:conversational_agent_client/src/domain/conversation.dart';
import 'package:conversational_agent_client/src/domain/message.dart';
import 'package:conversational_agent_client/src/domain/prompt.dart';
import 'package:conversational_agent_client/src/domain/user_id.dart';
import 'package:conversational_agent_client/src/utilities/constants/base.dart';
import 'package:conversational_agent_client/src/utilities/extensions/response_extension.dart';
import 'package:conversational_agent_client/src/utilities/log.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversation_repository.g.dart';

class ConversationRepository {
  ConversationRepository(this.ref);
  final Ref ref;

  final _log = logger(className: "$ConversationRepository");

  ///create userId before starting conversational using Post request
  ///send origin
  ///return [UserID]
  Future<UserID?> createUserId() async {
    final client = ref.read(dioProvider);
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

      final UserID? userId = response.userIdParser();
      return userId;
    } catch (e, s) {
      _log.e("err => $e, stack => $s");
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

      final Message? message = response.messageParser();
      return message;
    } catch (e, s) {
      _log.e("err => $e, stack => $s");
      return null;
    }
  }

  ///retrieve [List<Message>] previous conversation thread using Get request
  ///send [UserID] as queryParma
  /// return null if [UserNotFound] is found
  Future<List<Message>?> getChatHistory({required UserID userId}) async {
    Set<Message> messages = {};

    try {
      final client = ref.read(dioProvider);

      // get user, create one when null
      final Uri uri = Uri.https(Base.url, Base.chatHistory, userId.toJson());
      final Response response = await client.getUri(uri);
      final List<Conversation> conversations = response.conversationParser();
//remap
      for (var data in conversations) {
        final Message message = Message(
            message: data.content[0].text.value.message,
            role: data.role == Role.user.value ? Role.user : Role.assistant,
            id: data.id,
            createdAt: DateTime(data.createdAt));
        messages.add(message);
      }
      return messages.toList();
    } catch (e, s) {
      _log.e("err => $e, stack => $s");
      return null;
    }
  }
}

@riverpod
ConversationRepository conversationRepository(Ref ref) {
  return ConversationRepository(ref);
}
