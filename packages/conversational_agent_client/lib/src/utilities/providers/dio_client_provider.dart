import 'package:conversational_agent_client/src/utilities/constants/status_codes.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'dio_client_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  //cover status code between 200 and 404
  dio.options.validateStatus = (int? status) {
    return status != null && status >= StatusCode.success.code && status <= StatusCode.notFound.code;
  };

  return dio;
}
