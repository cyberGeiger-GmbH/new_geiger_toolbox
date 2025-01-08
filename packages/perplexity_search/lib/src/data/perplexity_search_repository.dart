import 'package:dio/dio.dart';
import 'package:perplexity_search/src/domain/description.dart';
import 'package:perplexity_search/src/exceptions/perplexity_exception.dart';
import 'package:perplexity_search/src/utilities/constants/base.dart';
import 'package:perplexity_search/src/utilities/dio_client.dart';
import 'package:perplexity_search/src/utilities/extensions.dart';
import 'package:perplexity_search/src/utilities/logging_handler.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'perplexity_search_repository.g.dart';

class PerplexitySearchRepository {
  final Ref ref;
  PerplexitySearchRepository(this.ref);

  Future<Description?> searchCompanyDescription(
      {required String companyName, required String location, required String apiKey}) async {
    final client = ref.read(dioClientProvider);
    final log = ref.read(loggingHandlerProvider("searchCompanyDescription"));

    try {
      final Uri uri = Uri.https(Base.baseUrl, Base.chatPath);
      final data = {
        "temperature": 0,
        "model": "llama-3.1-sonar-small-128k-online",
        "messages": [
          {
            "content":
                "you are a search enginer. what company does base on the name and the location provided. the result show be short",
            "role": "system"
          },
          {
            "role": "user",
            "content": "who is $companyName from Freiburg, $location"
          }
        ]
      };

      final Map<String, String> headers = {};
      final authorization = {"Authorization": "Bearer $apiKey"};

      headers.addEntries(Base.contentType.entries);
      headers.addEntries(authorization.entries);

      final Response response = await client.postUri(
        uri,
        data: data,
        options: Options(headers: headers),
      );

      // print("api key => $authorization");
      return response.searchParser(ref);
    } catch (e, s) {
      log.e("err => $e, stack => $s");
      throw ServerException(code: "500", message: e.toString());
    }
  }
}

@riverpod
PerplexitySearchRepository perplexitySearchRepository(Ref ref) {
  return PerplexitySearchRepository(ref);
}
