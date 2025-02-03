import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile_screen_controller.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/user_profile_screen.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/settings/settings_screen.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms_condition_controller.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms_condition_screen.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_news_feed_repository.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/clear_data/tester_buttons.dart';

import 'package:geiger_toolbox/src/monitoring/logger_navigator_observer.dart';

import 'package:geiger_toolbox/src/routing/navigation/scaffold_with_navigation.dart';
import 'package:geiger_toolbox/src/routing/not_found_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../features/threat_assessment/presentation/main_screen.dart';
import '../features/threat_assessment/presentation/news_details/news_details_screen.dart';

part 'app_routing.g.dart';

// ignore: prefer-match-file-name
enum AppRouter {
  main(path: "/", name: "main-screen"),
  newsFeedDetails(path: "/newsfeed/:news", name: "news"),
  community(path: "/community", name: "community"),
  calendar(path: "/calendar", name: "calendar"),
  settings(path: "/settings", name: "settings"),
  chat(path: "/chat", name: "chat"),
  createProfile(path: "/create-profile", name: "create-profile"),
  termsAndCondition(
      path: "/terms-and-conditions", name: "terms-and-conditions-screen");

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
    return GoRouter(
      navigatorKey: _rootNavKey,
      initialLocation: AppRouter.main.path,
      debugLogDiagnostics: true,
      errorBuilder: (context, state) => const NotFoundScreen(),
      observers: [
        if (appFlavor == Flavor.dev.name || appFlavor == Flavor.stg.name)
          //tracking navigation events
          SentryNavigatorObserver(),
        //analytics
        LoggerNavigatorObserver(ref),
      ],
      redirect: (context, state) {
        final termsConditionState = ref.read(termsConditionControllerProvider);
        //final isNewsFeedEmpty = ref.read(isNewsTableEmptyProvider).requireValue;
        final companyProfileState =
            ref.read(fetchCompanyProvider).requireValue == null;

        final skipProfile = ref.read(profileScreenControllerProvider);

        final path = state.uri.path;
        // redirect to [TermAndConditionsScreen]
        if (!termsConditionState) {
          if (path != AppRouter.termsAndCondition.path) {
            return AppRouter.termsAndCondition.path;
          }

          return null;
        }

        //redirect to profile screen when profile is null, skip is false and news feed table is not empty
        // if (companyProfileState && !skipProfile && !isNewsFeedEmpty) {
        if (companyProfileState && !skipProfile) {
          if (path != AppRouter.createProfile.path) {
            return AppRouter.createProfile.path;
          }

          return null; // No redirect needed
        }

        return null;
      },
      //todo: add refreshListen
      // refreshListenable:  GoRouterRefreshStream(d),
      routes: [
        //for ui without bottom navigation

        GoRoute(
          path: AppRouter.termsAndCondition.path,
          name: AppRouter.termsAndCondition.name,
          pageBuilder: (context, state) => NoTransitionPage<void>(
              child: TermsConditionScreen(),
              key: state.pageKey,
              name: state.name),
        ),

        GoRoute(
          path: AppRouter.createProfile.path,
          name: AppRouter.createProfile.name,
          pageBuilder: (context, state) => MaterialPage<void>(
              fullscreenDialog: true,
              child: CreateProfileScreen(
                onCloseProfile: () {
                  ref.read(profileScreenControllerProvider.notifier).skip(true);

                  context.goNamed(AppRouter.main.name);
                },
              ),
              key: state.pageKey,
              name: state.name),
        ),

        //for ui with bottom navigation
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => ScaffoldWithNavigation(
            navigationShell: navigationShell,
            feedbackButton:
                (getFlavor() == Flavor.dev || getFlavor() == Flavor.stg)
                    ? TesterButtons()
                    : null,
          ),
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellHomeNavKey,
              observers: [
                //analytics
                LoggerNavigatorObserver(ref),
              ],
              routes: [
                GoRoute(
                  path: AppRouter.main.path,
                  name: AppRouter.main.name,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: MainScreen(),
                    key: state.pageKey,
                    name: state.name,
                  ),
                  //nested route
                  routes: [
                    GoRoute(
                      path: AppRouter.newsFeedDetails.path,
                      name: AppRouter.newsFeedDetails.name,
                      pageBuilder: (context, state) {
                        final title = state
                            .pathParameters[AppRouter.newsFeedDetails.name]!;

                        return MaterialPage(
                          //fullscreenDialog: true,
                          child: NewsDetailsScreen(
                            newsTitle: title,
                            key: state.pageKey,
                          ),
                          key: state.pageKey,
                          name: state.name,
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
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: Community(),
                    key: state.pageKey,
                    name: state.name,
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
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: Calendar(),
                    key: state.pageKey,
                    name: state.name,
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
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: Chat(),
                    key: state.pageKey,
                    name: state.name,
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
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: SettingsScreen(),
                    key: state.pageKey,
                    name: state.name,
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
