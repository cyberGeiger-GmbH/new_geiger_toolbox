// ignore_for_file: avoid-throw-in-catch-block


import 'dart:convert';
import 'dart:io';
import 'package:conversational_agent_client/src/domain/profile.dart';
import 'package:conversational_agent_client/src/domain/news.dart';
import 'package:conversational_agent_client/src/exception/remote_exceptions.dart';

import 'package:conversational_agent_client/src/utilities/constants/base.dart';

import 'package:conversational_agent_client/src/utilities/extensions/response_extension.dart';
import 'package:conversational_agent_client/src/utilities/log_handling.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_repository.g.dart';

class NewsRepository {
  final Ref ref;

  NewsRepository(this.ref);

  Future<List<News>> fetchNews({Profile? profile}) async {
    final dio = ref.read(dioProvider);
    final log = ref.read(logHandlerProvider("FetchNews"));

    try {
      final Uri uri = Uri.https(
        Base.url,
        Base.newsPath,
      );

      final Response response = await dio.getUri(uri,
          data: profile != null
              ? json.encode(profile.toJson())
              : json.encode({"locale": "en"}),
          options: Options(headers: Base.headers));

      return response.newsParser(ref);
    } on DioException catch (e, s) {
      log.e("failed to get => $e, stack => $s");
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeoutException();
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw ServerTimeOutException();
      } else if (e.type == DioExceptionType.badResponse) {
        throw BadResponseException();
      } else if (e.type == DioExceptionType.unknown &&
          e.error is SocketException) {
        throw InterConnectionException();
      } else if (e.type == DioExceptionType.connectionError) {
        throw (ConnectionErrorException());
      }
      throw DioException(
          requestOptions: RequestOptions(
            data: profile,
          ),
          error: e);
    } catch (e, s) {
      log.e("failed to get => $e, stack => $s");
      throw NewsFeedException();
    }
  }
}

@riverpod
NewsRepository newsRepository(Ref ref) {
  return NewsRepository(ref);
}
