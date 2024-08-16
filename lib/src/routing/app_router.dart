import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/authentication/presentation/login_screen.dart';
import '../features/authentication/presentation/register_screen.dart';
import '../features/authentication/presentation/welcome_screen.dart';
import '../features/products/presentation/home_screen.dart';
import 'not_found_screen.dart';
import 'scaffold_with_nested_navigation.dart';

part 'app_router.g.dart';

enum AppRoute {
  welcome,
  login,
  register,
  home,
  order,
  cart,
  favourite,
  profile,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _orderNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'order');
final _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');
final _favouriteNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favourite');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
          path: '/welcome',
          name: AppRoute.welcome.name,
          pageBuilder: (context, state) => const NoTransitionPage(
                child: WelcomeScreen(),
              ),
          routes: [
            GoRoute(
              path: 'login',
              name: AppRoute.login.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: LoginScreen(),
              ),
            ),
            GoRoute(
              path: 'register',
              name: AppRoute.register.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RegisterScreen(),
              ),
            ),
          ]),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: ScaffoldWithNestedNavigation(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          // StatefulShellBranch(navigatorKey: _scanNavigatorKey, routes: [
          //   GoRoute(
          //     path: '/order',
          //     name: AppRoute.order.name,
          //     pageBuilder: (context, state) => const NoTransitionPage(
          //       child: OrderScreen(),
          //     ),
          //   ),
          // ]),
          // StatefulShellBranch(navigatorKey: _scanNavigatorKey, routes: [
          //   GoRoute(
          //     path: '/cart',
          //     name: AppRoute.cart.name,
          //     pageBuilder: (context, state) => const NoTransitionPage(
          //       child: CartScreen(),
          //     ),
          //   ),
          // ]),
          // StatefulShellBranch(navigatorKey: _scanNavigatorKey, routes: [
          //   GoRoute(
          //     path: '/favourite',
          //     name: AppRoute.favourite.name,
          //     pageBuilder: (context, state) => const NoTransitionPage(
          //       child: FavouriteScreen(),
          //     ),
          //   ),
          // ]),
          // StatefulShellBranch(navigatorKey: _scanNavigatorKey, routes: [
          //   GoRoute(
          //     path: '/profile',
          //     name: AppRoute.profile.name,
          //     pageBuilder: (context, state) => const NoTransitionPage(
          //       child: ProfileScreen(),
          //     ),
          //   ),
          // ]),
        ],
      )
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
