import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_launcher_provider.g.dart';

/// A simple wrapper for the url_launcher package
class UrlLauncher {
  final Ref ref;

  UrlLauncher(this.ref);

  static const _name = 'URL Launcher';

  Future<bool> launch(Uri uri,
      {LaunchMode mode = LaunchMode.platformDefault}) async {
    final log = ref.read(logHandlerProvider(_name));

    if (await canLaunchUrl(uri)) {
      log.i(uri);
      return await launchUrl(uri, mode: mode);
    } else {
      log.e('Cannot launch URL: $uri');
      throw UrlLauncherException(uri);
    }
  }
}

class UrlLauncherException implements Exception {
  const UrlLauncherException(this.uri);
  final Uri uri;

  String get message => 'Cannot launch URL: ${uri.toString()}';

  @override
  String toString() => 'UrlLauncherException(${uri.toString()})';
}

@riverpod
UrlLauncher urlLauncher(Ref ref) {
  return UrlLauncher(ref);
}
