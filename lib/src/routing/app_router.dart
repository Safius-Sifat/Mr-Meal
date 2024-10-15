import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common_widgets/coming_soon_screen.dart';
import '../features/address/presentation/select_location_screen.dart';
import '../features/announcement/presentation/announcement_screen.dart';
import '../features/authentication/data/auth_repository.dart';
import '../features/authentication/presentation/forgot_password/ask_email_screen.dart';
import '../features/authentication/presentation/forgot_password/forgot_password_screen.dart';
import '../features/authentication/presentation/login/login_screen.dart';
import '../features/authentication/presentation/register/register_screen.dart';
import '../features/authentication/presentation/verify_email/verification_screen.dart';
import '../features/authentication/presentation/welcome_screen.dart';
import '../features/cart/presentation/shopping_cart/shopping_cart_screen.dart';
import '../features/delivery_schedule/presentation/delivery_schedule_screen.dart';
import '../features/favourite/presentation/favourite_screen.dart';
import '../features/meal_on_off/presentation/guest_meal_screen.dart';
import '../features/meal_on_off/presentation/meal_on_off_screen.dart';
import '../features/notification/presentation/notification_screen.dart';
import '../features/payment/presentation/payment_screen.dart';
import '../features/products/presentation/all_package/package_details_screen.dart';
import '../features/products/presentation/all_package/package_screen.dart';
import '../features/products/presentation/category/category_screen.dart';
import '../features/products/presentation/home/home_screen.dart';
import '../features/products/presentation/item_screen/item_detail_screen.dart';
import '../features/products/presentation/item_screen/item_screen.dart';
import '../features/products/presentation/todays_menu/todays_menu_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/report/presentation/meal_history_screen.dart';
import '../features/report/presentation/my_report_screen.dart';
import '../features/report/presentation/recharge_history_screen.dart';
import '../features/wallet/presentation/select_amount_screen.dart';
import '../features/wallet/presentation/wallet_screen.dart';
import 'go_router_refresh_stream.dart';
import 'not_found_screen.dart';
import 'scaffold_with_nested_navigation.dart';

part 'app_router.g.dart';

enum AppRoute {
  welcome,
  login,
  register,
  askEmail,
  verifyEmail,
  forgotPassword,
  changePassword,
  home,
  order,
  announcement,
  cart,
  favourite,
  profile,
  items,
  itemDetail,
  category,
  package,
  packageDetail,
  todaysMenu,
  notification,
  mealOnOff,
  guestMeal,
  deliverySchedule,
  location,
  wallet,
  myReport,
  payment,
  inputAmount,
  rechargeHistory,
  mealHistory,
  comingSoon,
}

final _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');

final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _orderNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'order');
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _favouriteNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'favourite');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
const _locationKey = ValueKey('location');

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/welcome') {
          return '/';
        }
      } else {
        if (path == '/profile' || path == '/order') {
          return '/welcome';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
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
                routes: [
                  GoRoute(
                    path: 'askEmail',
                    name: AppRoute.askEmail.name,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: AskEmailScreen(),
                    ),
                  ),
                  GoRoute(
                    path: 'verifyEmail',
                    name: AppRoute.verifyEmail.name,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: VerificationScreen(
                        // email: state.pathParameters['email']!,
                        email: 'safiussifat@gmail.com',
                      ),
                    ),
                  ),
                  GoRoute(
                    path: 'forgotPassword',
                    name: AppRoute.forgotPassword.name,
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ForgotPasswordScreen(
                        email: state.pathParameters['email']!,
                      ),
                    ),
                  ),
                ]),
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
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: HomeScreen(),
                      ),
                  routes: [
                    GoRoute(
                      path: 'itemDetail/:id',
                      name: AppRoute.itemDetail.name,
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: ItemDetailScreen(
                          id: int.parse(state.pathParameters['id']!),
                        ),
                      ),
                    ),
                    GoRoute(
                      path: 'comingSoon',
                      name: AppRoute.comingSoon.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: ComingSoonScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'location/:locationType',
                      name: AppRoute.location.name,
                      pageBuilder: (context, state) => NoTransitionPage(
                        key: _locationKey,
                        child: SelectLocationScreen(
                          locationType: state.pathParameters['locationType']!,
                        ),
                      ),
                    ),
                    GoRoute(
                      path: 'mealOnOff',
                      name: AppRoute.mealOnOff.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: MealOnOffScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'guestMeal',
                      name: AppRoute.guestMeal.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: GuestMealScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'deliverySchedule',
                      name: AppRoute.deliverySchedule.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: DeliveryScheduleScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'items',
                      name: AppRoute.items.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: ItemScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'category',
                      name: AppRoute.category.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: CategoryScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'package',
                      name: AppRoute.package.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: AllPackageScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'packageDetail/:id',
                      name: AppRoute.packageDetail.name,
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: PackageDetailScreen(
                          id: int.parse(state.pathParameters['id']!),
                        ),
                      ),
                    ),
                    GoRoute(
                      path: 'todaysMenu',
                      name: AppRoute.todaysMenu.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: TodaysMenuScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'notification',
                      name: AppRoute.notification.name,
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: NotificationScreen(),
                      ),
                    ),
                    GoRoute(
                      path: 'payment/:url',
                      name: AppRoute.payment.name,
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: PaymentScreen(
                          paymentUrl: state.pathParameters['url']!,
                        ),
                      ),
                    ),
                  ]),
            ],
          ),

          StatefulShellBranch(navigatorKey: _orderNavigatorKey, routes: [
            GoRoute(
              path: '/announcement',
              name: AppRoute.announcement.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AnnouncementScreen(),
              ),
            ),
          ]),
          // StatefulShellBranch(navigatorKey: _orderNavigatorKey, routes: [
          //   GoRoute(
          //     path: '/order',
          //     name: AppRoute.order.name,
          //     pageBuilder: (context, state) => NoTransitionPage(
          //       child: OrderScreen(),
          //     ),
          //   ),
          // ]),
          StatefulShellBranch(navigatorKey: _cartNavigatorKey, routes: [
            GoRoute(
              path: '/cart',
              name: AppRoute.cart.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ShoppingCartScreen(),
              ),
            ),
          ]),
          StatefulShellBranch(navigatorKey: _favouriteNavigatorKey, routes: [
            GoRoute(
              path: '/favourite',
              name: AppRoute.favourite.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FavouriteScreen(),
              ),
            ),
          ]),
          StatefulShellBranch(navigatorKey: _profileNavigatorKey, routes: [
            GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: ProfileScreen(),
                    ),
                routes: [
                  GoRoute(
                      path: 'wallet',
                      name: AppRoute.wallet.name,
                      pageBuilder: (context, state) => const NoTransitionPage(
                            child: WalletScreen(),
                          ),
                      routes: [
                        GoRoute(
                          path: 'selectAmount',
                          name: AppRoute.inputAmount.name,
                          pageBuilder: (context, state) => const MaterialPage(
                            fullscreenDialog: true,
                            child: SelectAmountScreen(),
                          ),
                        ),
                      ]),
                  GoRoute(
                    path: 'myReport',
                    name: AppRoute.myReport.name,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: MyReportScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: 'rechargeHistory',
                        name: AppRoute.rechargeHistory.name,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: RechargeHistoryScreen(),
                        ),
                      ),
                      GoRoute(
                        path: 'mealHistory',
                        name: AppRoute.mealHistory.name,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: MealHistoryScreen(),
                        ),
                      ),
                    ],
                  ),
                ]),
          ]),
        ],
      )
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}
