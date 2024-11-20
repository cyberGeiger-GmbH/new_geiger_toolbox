import 'dart:convert';

import 'package:conversational_agent_client/conversational_agent_client.dart';

extension NewsListExtensions on List<News> {
  /// Converts List<News> to a list of JSON maps
  List<Map<String, dynamic>> _toJsonList() {
    return map((news) => news.toJson()).toList();
  }

  /// Converts List<News> to a JSON string
  String toJsonString() {
    return json.encode(_toJsonList());
  }
}
