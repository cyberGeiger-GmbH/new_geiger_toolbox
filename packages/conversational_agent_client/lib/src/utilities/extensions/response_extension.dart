import 'package:conversational_agent_client/src/domain/news.dart';
import 'package:conversational_agent_client/src/domain/news_object.dart';
import 'package:conversational_agent_client/src/domain/user_id.dart';
import 'package:conversational_agent_client/src/utilities/constants/status_codes.dart';
import 'package:dio/dio.dart';

extension DataParser<T> on Response {
  List<News> newsParse() {
    final StatusCode? code = StatusCodes.getStatus(statusCode!);
    if (code != null && code == StatusCode.success) {
      return NewsObject.fromJson(data).news;
    }
    return [];
  }

  UserID? userIdParse() {
    final StatusCode? code = StatusCodes.getStatus(statusCode!);
    if (code != null && code == StatusCode.success) {
      return UserID.fromJson(data);
    }
    return null;
  }
}
