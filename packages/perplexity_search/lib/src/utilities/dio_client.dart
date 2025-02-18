import 'package:dio/dio.dart';
import 'package:perplexity_search/src/utilities/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(Ref ref) {
  final dio = Dio();
  //cover status code between 200 and 404
  dio.options.validateStatus = (int? status) {
    return status != null && status >= StatusCode.success.code && status <= StatusCode.notFound.code;
  };

  return dio;
}
