/// Helper class to access the environment variables defined with --dart-define
class Env {
  static String get perplexityApiKey =>
      const String.fromEnvironment('PERPLEXITY_API_KEY');

  Env._();
}
