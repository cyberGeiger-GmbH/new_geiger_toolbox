import 'package:dio/dio.dart';
import 'package:perplexity_search/src/domain/choices.dart';
import 'package:perplexity_search/src/domain/description.dart';
import 'package:perplexity_search/src/utilities/enums.dart';
import 'package:perplexity_search/src/utilities/status_codes.dart';
import 'package:riverpod/riverpod.dart';

extension ResponseExtension<T> on Response {
  Description? searchParser(Ref ref) {
    final codeProvider = ref.read(statusCodesProvider);
    final StatusCode? code = codeProvider.getStatus(statusCode);

    if (code != null && code == StatusCode.success) {
      final choice = Choices.fromJson(data);
      final description = Description(references: choice.citations, description: choice.choices[0].message.content);
      return description;
    }
    return null;
  }
}
