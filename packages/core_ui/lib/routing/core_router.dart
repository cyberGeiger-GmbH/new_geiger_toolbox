// import 'package:core_ui/env/env.dart';
// import 'package:core_ui/organisms/core_scaffold_with_navigation.dart';
// import 'package:core_ui/pages/calendar.dart';
// import 'package:core_ui/pages/chat.dart';
// import 'package:core_ui/pages/community.dart';
// import 'package:core_ui/pages/design_system.dart';
// import 'package:core_ui/pages/detail_threat.dart';
// import 'package:core_ui/pages/home.dart';
// import 'package:core_ui/pages/settings.dart';
// import 'package:core_ui/pages/terms_and_conditions.dart';
// import 'package:core_ui/pages/not_found.dart';
// import 'package:flutter/material.dart';

// enum CoreAppRouter {
//   home(path: "/", name: "home"),
//   detailThreat(path: "/threat/:id", name: "detailThreat"),
//   community(path: "/communtiy", name: "community"),
//   calendar(path: "/calendar", name: "calendar"),
//   settings(path: "/settings", name: "settings"),
//   chat(path: "/chat", name: "chat"),
//   termsAndCondation(
//       path: "/terms-and-conditions", name: "terms-and-conditions"),
//   designSystem(path: "/design-system", name: "designSystem");

//   const CoreAppRouter({required this.path, required this.name});
//   final String path;
//   final String name;
// }

// class CoreRouter {
//   CoreRouter();

//   final GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();
//   final GlobalKey<NavigatorState> _shellHomeNavKey =
//       GlobalKey<NavigatorState>(debugLabel: "shellHome");
//   final GlobalKey<NavigatorState> _shellCommunityNavKey =
//       GlobalKey<NavigatorState>(debugLabel: "shellCommunity");
//   final GlobalKey<NavigatorState> _shellCalendarNavKey =
//       GlobalKey<NavigatorState>(debugLabel: "shellCalendar");

//   final GlobalKey<NavigatorState> _shellChatNavKey =
//       GlobalKey<NavigatorState>(debugLabel: "shellChat");
//   final GlobalKey<NavigatorState> _shellSettingNavKey =
//       GlobalKey<NavigatorState>(debugLabel: "shellSetting");

//   GoRouter get goRouter {
//     return GoRouter(
//       navigatorKey: _rootNavKey,
//       initialLocation: CoreAppRouter.home.path,
//       debugLogDiagnostics: true,
//       errorBuilder: (context, state) => const NotFound(),
//       routes: [
//         //for ui with bottom navigation
//         StatefulShellRoute.indexedStack(
//           builder: (context, state, navigationShell) =>
//               CoreScaffoldWithNavigation(navigationShell: navigationShell),
//           branches: [
//             StatefulShellBranch(
//               navigatorKey: _shellHomeNavKey,
//               routes: [
//                 GoRoute(
//                   path: CoreAppRouter.home.path,
//                   name: CoreAppRouter.home.name,
//                   pageBuilder: (context, state) => const NoTransitionPage(
//                     child: Home(),
//                   ),
//                   //nested route
//                   routes: [
//                     GoRoute(
//                       path: CoreAppRouter.detailThreat.path,
//                       name: CoreAppRouter.detailThreat.name,
//                       pageBuilder: (context, state) {
//                         final id = state.pathParameters["id"]!;
//                         return NoTransitionPage(
//                           child: DetailThreat(threatId: id),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             StatefulShellBranch(
//               navigatorKey: _shellCommunityNavKey,
//               routes: [
//                 GoRoute(
//                   path: CoreAppRouter.community.path,
//                   name: CoreAppRouter.community.name,
//                   pageBuilder: (context, state) => const NoTransitionPage(
//                     child: Community(),
//                   ),
//                 )
//               ],
//             ),
//             StatefulShellBranch(
//               navigatorKey: _shellCalendarNavKey,
//               routes: [
//                 GoRoute(
//                   path: CoreAppRouter.calendar.path,
//                   name: CoreAppRouter.calendar.name,
//                   pageBuilder: (context, state) => const NoTransitionPage(
//                     child: Calendar(),
//                   ),
//                 )
//               ],
//             ),
//             StatefulShellBranch(
//               navigatorKey: _shellChatNavKey,
//               routes: [
//                 GoRoute(
//                   path: CoreAppRouter.chat.path,
//                   name: CoreAppRouter.chat.name,
//                   pageBuilder: (context, state) => const NoTransitionPage(
//                     child: Chat(),
//                   ),
//                 )
//               ],
//             ),
//             StatefulShellBranch(
//               navigatorKey: _shellSettingNavKey,
//               routes: [
//                 GoRoute(
//                   path: CoreAppRouter.settings.path,
//                   name: CoreAppRouter.settings.name,
//                   pageBuilder: (context, state) => const NoTransitionPage(
//                     child: Settings(),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//         //for ui without bottom navigation
//         GoRoute(
//           path: CoreAppRouter.termsAndCondation.path,
//           name: CoreAppRouter.termsAndCondation.name,
//           pageBuilder: (context, state) => const MaterialPage(
//             child: TermsAndConditions(),
//           ),
//         ),

//         if (Env.type.contains("designSystem"))
//           GoRoute(
//             path: CoreAppRouter.designSystem.path,
//             name: CoreAppRouter.designSystem.name,
//             pageBuilder: (context, state) => const MaterialPage(
//               child: DesignSystem(),
//             ),
//           ),
//       ],
//     );
//   }
// }
