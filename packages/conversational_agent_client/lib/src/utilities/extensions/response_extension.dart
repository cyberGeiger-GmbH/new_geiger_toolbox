import 'package:conversational_agent_client/src/domain/conversation.dart';
import 'package:conversational_agent_client/src/domain/message.dart';
import 'package:conversational_agent_client/src/domain/news.dart';

import 'package:conversational_agent_client/src/domain/user_id.dart';
import 'package:conversational_agent_client/src/utilities/constants/status_codes.dart';
import 'package:dio/dio.dart';

extension DataParser<T> on Response {
  List<News> newsParser() {
    final StatusCode? code = StatusCodes.getStatus(statusCode!);

    if (code != null && code == StatusCode.success) {
      return News.getNews(data);
 
    }
    return [];
  }

  UserID? userIdParser() {
    final StatusCode? code = StatusCodes.getStatus(statusCode!);
    if (code != null && code == StatusCode.success) {
      return UserID.fromJson(data);
    }
    return null;
  }

  Message? messageParser() {
    final StatusCode? code = StatusCodes.getStatus(statusCode!);
    if (code != null && code == StatusCode.success) {
      //todo check if data is has error message
      //ErrorMessage(status, type)
      return Message.fromJson(data);
    }
    return null;
  }

  List<Conversation> conversationParser() {
    final StatusCode? code = StatusCodes.getStatus(statusCode!);
    if (code != null && code == StatusCode.success) {
      //todo check if data is has error message

      final conversations = Conversation.getConversations(data);

      return conversations;
    }
    return [];
  }
}
