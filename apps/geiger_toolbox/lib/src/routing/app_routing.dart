import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms_condition_controller.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms_condition_screen.dart';
import 'package:geiger_toolbox/src/routing/app_start_up_widget.dart';
import 'package:geiger_toolbox/src/routing/navigation/scaffold_with_navigation.dart';
import 'package:geiger_toolbox/src/routing/not_found_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../features/threat_assessment/presentation/home_screen.dart';
import '../features/threat_assessment/presentation/news_feed/news_feed_screen.dart';
part 'app_routing.g.dart';

// ignore: prefer-match-file-name
enum AppRouter {
  appStartUp(name: "appStartUp", path: "/app-starup"),
  main(path: "/", name: "main"),
  newsFeedDetails(path: "/newsfeed/:title", name: "title"),
  community(path: "/community", name: "community"),
  calendar(path: "/calendar", name: "calendar"),
  settings(path: "/settings", name: "settings"),
  chat(path: "/chat", name: "chat"),
  termsAndCondition(
      path: "/terms-and-conditions", name: "terms-and-conditions");

  const AppRouter({required this.path, required this.name});
  final String path;
  final String name;
}

class AppRouting {
  static final GlobalKey<NavigatorState> _rootNavKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellHomeNavKey =
      GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final GlobalKey<NavigatorState> _shellCommunityNavKey =
      GlobalKey<NavigatorState>(debugLabel: "shellCommunity");
  static final GlobalKey<NavigatorState> _shellCalendarNavKey =
      GlobalKey<NavigatorState>(debugLabel: "shellCalendar");

  static final GlobalKey<NavigatorState> _shellChatNavKey =
      GlobalKey<NavigatorState>(debugLabel: "shellChat");
  static final GlobalKey<NavigatorState> _shellSettingNavKey =
      GlobalKey<NavigatorState>(debugLabel: "shellSetting");

  AppRouting._();
  static GoRouter goRouter(Ref ref) {
    //rebuild GoRouter when app startup state changes

    final appStartUpState = ref.watch(appStartUpProvider);

    return GoRouter(
      navigatorKey: _rootNavKey,
      initialLocation: AppRouter.termsAndCondition.path,
      debugLogDiagnostics: true,
      errorBuilder: (context, state) => const NotFoundScreen(),
      observers: [
        if (appFlavor == "dev" || appFlavor == "stg") SentryNavigatorObserver()
      ],
      redirect: (context, state) {
        // if the app is still initialing, show the /startup route
        if (appStartUpState.isLoading || appStartUpState.hasError) {
          return AppRouter.appStartUp.path;
        }

        final termsConditionState = ref.read(termsConditionControllerProvider);
        if (termsConditionState && state.path != AppRouter.main.path) {
          return AppRouter.main.path;
        }
        if (!termsConditionState &&
            state.path != AppRouter.termsAndCondition.path) {
          return AppRouter.termsAndCondition.path;
        }

        return null;
      },
      routes: [
        //for ui without bottom navigation
        GoRoute(
          path: AppRouter.appStartUp.path,
          name: AppRouter.appStartUp.name,
          pageBuilder: (context, state) => NoTransitionPage(
            child: AppStartUpWidget(
                // key: state.pageKey,
                //* the loaded route will be managed by GoRouter on state change
                //* this can be placeholde

                onLoaded: (context) => const SizedBox.shrink()),
          ),
        ),
        GoRoute(
          path: AppRouter.termsAndCondition.path,
          name: AppRouter.termsAndCondition.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: TermsConditionScreen()),
        ),

        //for ui with bottom navigation
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ScaffoldWithNavigation(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellHomeNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.main.path,
                  name: AppRouter.main.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomeScreen(),
                  ),
                  //nested route
                  routes: [
                    GoRoute(
                      path: AppRouter.newsFeedDetails.path,
                      name: AppRouter.newsFeedDetails.name,
                      pageBuilder: (context, state) {
                        final title = state
                            .pathParameters[AppRouter.newsFeedDetails.name]!;

                        return NoTransitionPage(
                          child: NewsFeedScreen(newsTitle: title),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellCommunityNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.community.path,
                  name: AppRouter.community.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Community(),
                  ),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellCalendarNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.calendar.path,
                  name: AppRouter.calendar.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Calendar(),
                  ),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellChatNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.chat.path,
                  name: AppRouter.chat.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Chat(),
                  ),
                )
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellSettingNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.settings.path,
                  name: AppRouter.settings.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Settings(),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

@riverpod
GoRouter goRouter(Ref ref) {
  //rebuild
  return AppRouting.goRouter(ref);
}

//todo: move to their respective domain

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Calendar"),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Chat Room"),
    );
  }
}

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Community"),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Settings"),
    );
  }
}
