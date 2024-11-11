import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/centered_text_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/routing/app_start_up.dart';
import 'package:geiger_toolbox/routing/navigation/scaffold_with_navigation.dart';
import 'package:geiger_toolbox/routing/not_found_screen.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/threat_assessment/presentation/home.dart';
part 'app_routing.g.dart';

enum AppRouter {
  appStartUp(name: "appStartUp", path: "/app-starup"),
  home(path: "/", name: "home"),
  detailThreat(path: "/threat/:id", name: "detailThreat"),
  community(path: "/communtiy", name: "community"),
  calendar(path: "/calendar", name: "calendar"),
  settings(path: "/settings", name: "settings"),
  chat(path: "/chat", name: "chat"),
  termsAndCondation(
      path: "/terms-and-conditions", name: "terms-and-conditions");

  const AppRouter({required this.path, required this.name});
  final String path;
  final String name;
}

class AppRouting {
  AppRouting._();

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

  static GoRouter goRouter(Ref ref) {
    //rebuild GoRouter when app startup state changes

    final appStartUpState = ref.watch(appStartUpProvider);

    return GoRouter(
      navigatorKey: _rootNavKey,
      initialLocation: AppRouter.home.path,
      debugLogDiagnostics: true,
      errorBuilder: (context, state) => const NotFoundScreen(),
      redirect: (context, state) {
        // if the app is still initialing, show the /startup route
        if (appStartUpState.isLoading || appStartUpState.hasError) {
          return AppRouter.appStartUp.path;
        }
        return null;
      },
      routes: [
         //for ui without bottom navigation
        GoRoute(
          path: AppRouter.termsAndCondation.path,
          name: AppRouter.termsAndCondation.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: TermsAndConditions(),
          ),
        ),
        GoRoute(
          path: AppRouter.appStartUp.path,
          name: AppRouter.appStartUp.name,
          pageBuilder: (context, state) => NoTransitionPage(
            child: AppStartUpWidget(
              //* this is a placeholder
              //* the loaded route will be managed by GoRouter on state change
              onLoaded: (_) => const SizedBox.shrink(),
            ),
          ),
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
                  path: AppRouter.home.path,
                  name: AppRouter.home.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: Home(),
                  ),
                  //nested route
                  routes: [
                    GoRoute(
                      path: AppRouter.detailThreat.path,
                      name: AppRouter.detailThreat.name,
                      pageBuilder: (context, state) {
                        final id = state.pathParameters["id"]!;
                        return NoTransitionPage(
                          child: DetailThreat(threatId: id),
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

class DetailThreat extends StatelessWidget {
  const DetailThreat({super.key, required this.threatId});
  final String threatId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("threat id => $threatId"),
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

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Terms and Condition Screent"),
          ),
          CenteredTextButton.tertiary(
            label: "Home",
            onTap: () {
              //todo
            },
            context: context,
          ),
        ],
      ),
    );
  }
}
