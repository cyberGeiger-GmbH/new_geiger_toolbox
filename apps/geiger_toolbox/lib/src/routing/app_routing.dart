import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile_screen_controller.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/user_profile_screen.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/intro/intro_screen.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/settings/settings_screen.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms/terms_condition_controller.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/clear_data/tester_buttons.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/category/todos_category_screen.dart';

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
  mainRouter(path: "/", name: "main-screen"),
  newDetailsRouter(path: "/newsfeed/:news", name: "news"),
  communityRouter(path: "/community", name: "community"),
  calendarRouter(path: "/calendar", name: "calendar"),
  settingsRouter(path: "/settings", name: "settings"),
  chatRouter(path: "/chat", name: "chat"),
  profileRouter(path: "/create-profile", name: "create-profile"),
  introRouter(path: "/intro", name: "intro-screen"),
  todoRouter(path: "/all-todos", name: "all-todos");

  const AppRouter({required this.path, required this.name});
  final String path;
  final String name;
}

class AppRouting {
  static final GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellHomeNavKey = GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final GlobalKey<NavigatorState> _shellCommunityNavKey = GlobalKey<NavigatorState>(
    debugLabel: "shellCommunity",
  );
  static final GlobalKey<NavigatorState> _shellCalendarNavKey = GlobalKey<NavigatorState>(debugLabel: "shellCalendar");

  static final GlobalKey<NavigatorState> _shellChatNavKey = GlobalKey<NavigatorState>(debugLabel: "shellChat");
  static final GlobalKey<NavigatorState> _shellSettingNavKey = GlobalKey<NavigatorState>(debugLabel: "shellSetting");

  AppRouting._();
  static GoRouter goRouter(Ref ref) {
    return GoRouter(
      navigatorKey: _rootNavKey,
      initialLocation: AppRouter.mainRouter.path,
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

        final skipProfile = ref.read(profileScreenControllerProvider);

        final path = state.uri.path;
        // redirect to [TermAndConditionsScreen]
        if (!termsConditionState) {
          if (path != AppRouter.introRouter.path) {
            return AppRouter.introRouter.path;
          }

          return null;
        }

        //redirect to profile screen when profile is null, skip is false and news feed table is not empty
        // if (companyProfileState && !skipProfile && !isNewsFeedEmpty) {
        if (!skipProfile) {
          if (path != AppRouter.profileRouter.path) {
            return AppRouter.profileRouter.path;
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
          path: AppRouter.introRouter.path,
          name: AppRouter.introRouter.name,
          pageBuilder:
              (context, state) => NoTransitionPage<void>(child: IntroScreen(), key: state.pageKey, name: state.name),
        ),

        GoRoute(
          path: AppRouter.profileRouter.path,
          name: AppRouter.profileRouter.name,
          pageBuilder:
              (context, state) => MaterialPage<void>(
                fullscreenDialog: true,
                child: CreateProfileScreen(
                  onCloseProfile: () {
                    ref.read(profileScreenControllerProvider.notifier).skip(true);

                    context.goNamed(AppRouter.mainRouter.name);
                  },
                ),
                key: state.pageKey,
                name: state.name,
              ),
        ),

        //for ui with bottom navigation
        StatefulShellRoute.indexedStack(
          builder:
              (context, state, navigationShell) => ScaffoldWithNavigation(
                navigationShell: navigationShell,
                feedbackButton: (getFlavor() == Flavor.dev || getFlavor() == Flavor.stg) ? TesterButtons() : null,
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
                  path: AppRouter.mainRouter.path,
                  name: AppRouter.mainRouter.name,
                  pageBuilder:
                      (context, state) => NoTransitionPage(child: MainScreen(), key: state.pageKey, name: state.name),
                  //nested route
                  routes: [
                    GoRoute(
                      path: AppRouter.newDetailsRouter.path,
                      name: AppRouter.newDetailsRouter.name,
                      pageBuilder: (context, state) {
                        final newsId = state.pathParameters[AppRouter.newDetailsRouter.name]!;

                        return MaterialPage(
                          //fullscreenDialog: true,
                          child: NewsDetailsScreen(newsId: newsId, key: state.pageKey),
                          key: state.pageKey,
                          name: state.name,
                        );
                      },
                    ),

                    GoRoute(
                      path: AppRouter.todoRouter.path,
                      name: AppRouter.todoRouter.name,
                      pageBuilder:
                          (context, state) =>
                              MaterialPage<void>(child: TodosCategoryScreen(), key: state.pageKey, name: state.name),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellCommunityNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.communityRouter.path,
                  name: AppRouter.communityRouter.name,
                  pageBuilder:
                      (context, state) => NoTransitionPage(child: Community(), key: state.pageKey, name: state.name),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellCalendarNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.calendarRouter.path,
                  name: AppRouter.calendarRouter.name,
                  pageBuilder:
                      (context, state) => NoTransitionPage(child: Calendar(), key: state.pageKey, name: state.name),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellChatNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.chatRouter.path,
                  name: AppRouter.chatRouter.name,
                  pageBuilder:
                      (context, state) => NoTransitionPage(child: Chat(), key: state.pageKey, name: state.name),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellSettingNavKey,
              routes: [
                GoRoute(
                  path: AppRouter.settingsRouter.path,
                  name: AppRouter.settingsRouter.name,
                  pageBuilder:
                      (context, state) =>
                          NoTransitionPage(child: SettingsScreen(), key: state.pageKey, name: state.name),
                ),
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
    return const Center(child: Text("Calendar"));
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Chat Room"));
  }
}

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Community"));
  }
}
