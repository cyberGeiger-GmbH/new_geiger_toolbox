/// Helper class to access the environment variables defined with --dart-define
class Env {
  static String get sentryDsn => const String.fromEnvironment('SENTRY_DSN');

  static String get mixpanelProjectToken => const String.fromEnvironment('MIXPANEL_PROJECT_TOKEN');

  static String get perplexityApiToken => const String.fromEnvironment('PERPLEXITY_API');

  static String get appStoreId => const String.fromEnvironment('APP_STORE_ID');

  static String get playStoreId => const String.fromEnvironment('PLAY_STORE_ID');

  Env._();
}
