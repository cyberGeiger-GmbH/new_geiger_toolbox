library conversational_agent_client;

import 'dart:convert';
import 'package:conversational_agent_client/src/domain/profile.dart';
import 'package:conversational_agent_client/src/domain/news.dart';

import 'package:conversational_agent_client/src/utilities/constants/base.dart';

import 'package:conversational_agent_client/src/utilities/extensions/response_extension.dart';
import 'package:conversational_agent_client/src/utilities/log.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_repository.g.dart';

class NewsRepository {
  final Ref ref;
  NewsRepository(this.ref);

  final _log = logger(className: "$NewsRepository");

  Future<List<News>?> fetchNews({Profile? profile}) async {
    final dio = ref.read(dioProvider);
    try {
      final Uri uri = Uri.https(
        Base.url,
        Base.newsPath,
      );

      final Response response = await dio.getUri(uri,
          data: profile != null ? json.encode(profile) : null,
          options: Options(headers: Base.headers));
      final data = response.newsParser();

      return data;
    } catch (e, s) {
      _log.e("failed to get => $e, stack => $s");
      return null;
    }
  }
}

@riverpod
NewsRepository newsRepository(Ref ref) {
  return NewsRepository(ref);
}
