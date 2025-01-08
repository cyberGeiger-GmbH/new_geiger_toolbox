import 'package:perplexity_search/env/env.dart';

class Base {
  static const baseUrl = "api.perplexity.ai";

  static const chatPath = "/chat/completions";

  static const contentType = {"Content-Type": "application/json"};

  static String? get apiKey {
    if (Env.perplexityApiKey.isEmpty) {
      return "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";
    }
    return Env.perplexityApiKey;
  }

  Base._();
}
