import 'dart:convert';

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

extension NewsListExtensions on List<News> {
  /// Converts List<News> to a list of JSON maps
  List<Map<String, dynamic>> _toJsonList() {
    return map((news) => news.toJson()).toList();
  }

  /// Converts List<News> to a JSON string
  String toJsonString() {
    return json.encode(_toJsonList());
  }

  List<Widget> toWidgetList({required context, int? currentIndex}) {
    return asMap()
        .entries
        .map((value) => AppButton.news(
              context: context,
              title: value.value.title,
              onPressed: () {
                debugPrint(
                    " go to detail newsfeed screen => ${value.value.title}");
              },
            ))
        .toList();
  }
}
