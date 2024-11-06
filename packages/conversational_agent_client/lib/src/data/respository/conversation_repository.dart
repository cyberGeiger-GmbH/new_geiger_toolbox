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

      final UserID? userId = response.userIdParse();
      return userId;
    } catch (e, s) {
      _log.e("err => $e, stack => $s");
      return null;
    }
  }

  ///start conversational
  ///send [Prompt] as body using a Post request
  ///return [Message]

  ///retrieve [List<Message>] previous conversation thread using Get request
  ///send [UserID] as queryParma
  /// return null if [UserNotFound] is found
}

@riverpod
ConversationRepository conversationRepository(Ref ref) {
  return ConversationRepository(ref);
}
