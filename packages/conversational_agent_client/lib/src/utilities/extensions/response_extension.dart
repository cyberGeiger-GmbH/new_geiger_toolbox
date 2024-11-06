import 'package:conversational_agent_client/src/domain/message.dart';
import 'package:conversational_agent_client/src/domain/news.dart';
import 'package:conversational_agent_client/src/domain/news_object.dart';
import 'package:conversational_agent_client/src/domain/user_id.dart';
import 'package:conversational_agent_client/src/utilities/constants/status_codes.dart';
import 'package:dio/dio.dart';

extension DataParser<T> on Response {
  List<News> newsParser() {
    final StatusCode? code = StatusCodes.getStatus(statusCode!);
    if (code != null && code == StatusCode.success) {
      return NewsObject.fromJson(data).news;
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
      print("response => $data");
      return Message.fromJson(data);
    }
    return null;
  }
}
