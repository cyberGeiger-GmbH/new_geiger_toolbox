
import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/monitoring/analytics_facade.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  static const _name = 'Navigation';

  final Ref ref;

  LoggerNavigatorObserver(this.ref);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(
      route.settings.name,
      'push',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'pop');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _logNavigation(newRoute.settings.name, 'replace');
    }
  }

  void _logNavigation(
    String? routeName,
    String action,
  ) {
    if (routeName != null) {
      ref.read(analyticsFacadeProvider).trackScreenView(routeName, action);
    } else {
      ref.read(logHandlerProvider(_name)).d("Route name is missing");
    }
  }
}
