// private navigators
import 'package:cj_flutter_riverpod_messaging_app/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/navigation_bar.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/login/login_page.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/messaging_chat/messaging_chat_page.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/messaging_list/messaging_list_page.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorMessagingKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorMessagingKey');

final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorProfileKey');

final goRouter = GoRouter(
  initialLocation: '/${MessageRouteNames.profile}',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    _login(),
    _register(),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MessageNavigationBar(navigationShell: navigationShell);
      },
      branches: [
        _messaging(),
        _profile(),
      ],
    ),
  ],
);

StatefulShellBranch _messaging() {
  return StatefulShellBranch(
    navigatorKey: _shellNavigatorMessagingKey,
    routes: [
      GoRoute(
        path: '/${MessageRouteNames.messagingList}',
        name: MessageRouteNames.messagingList,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MessagingListPage(),
          );
        },
      ),
      GoRoute(
        path: '/${MessageRouteNames.messagingChat}/:id',
        name: MessageRouteNames.messagingChat,
        builder: (context, state) =>
            MessagingChatPage(id: state.pathParameters['id']!),
      ),
    ],
  );
}

StatefulShellBranch _profile() {
  return StatefulShellBranch(
    navigatorKey: _shellNavigatorProfileKey,
    routes: [
      GoRoute(
        path: '/${MessageRouteNames.profile}',
        name: MessageRouteNames.profile,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SizedBox(),
        ),
      ),
    ],
  );
}

GoRoute _login() {
  return GoRoute(
    path: '/${MessageRouteNames.login}',
    name: MessageRouteNames.login,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: LoginPage(),
    ),
  );
}

GoRoute _register() {
  return GoRoute(
    path: '/${MessageRouteNames.register}',
    name: MessageRouteNames.register,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: RegisterPage(),
    ),
  );
}
