import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../utils/auth_state.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/on_boarding_screen.dart';
import '../screens/page_one.dart';
import '../screens/splash_screen.dart';
import 'page_path_and_name.dart';

part 'page_transitions.dart';
part 'transition_details.dart';
part 'transitions.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref: ref));

class AppRouter {
  final Ref _ref;

  AppRouter({required Ref ref}) : _ref = ref;

  // The getter that will be called
  GoRouter get router => _router;

  // We should always use pageBuilder to make sure that all animations work properly
  final _splashRoute = GoRoute(
    path: Pages.splash.path,
    name: Pages.splash.name,
    pageBuilder: (context, state) => NoTransitionPage(
      name: Pages.splash.name,
      child: const SplashScreen(),
    ),
  );

  late final _onBoardingRoute = GoRoute(
    path: Pages.onBoarding.path,
    name: Pages.onBoarding.name,
    pageBuilder: (context, state) {
      return getCustomTransition(
        TransitionDetails(
          context: context,
          state: state,
          page: const OnBoardingScreen(),
          name: Pages.onBoarding.name,
          transition: Transitions.slideLeftToRight,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.easeInToLinear,
        ),
      );
    },
  );

  late final _loginRoute = GoRoute(
    path: Pages.login.path,
    name: Pages.login.name,
    pageBuilder: (context, state) {
      return getCustomTransition(
        TransitionDetails(
          context: context,
          state: state,
          page: const LoginScreen(),
          name: Pages.login.name,
          transition: Transitions.slideLeftToRight,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.easeInToLinear,
        ),
      );
    },
  );

  late final _pageOneRoute = GoRoute(
    path: Pages.pageOne.path,
    name: Pages.pageOne.name,
    pageBuilder: (context, state) {
      return getCustomTransition(
        TransitionDetails(
          context: context,
          state: state,
          page: const PageOne(),
          name: Pages.pageOne.name,
          transition: _ref.read(transitionProvider),
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.easeInToLinear,
          duration: Durations.extralong4,
        ),
      );
    },
  );

  late final _homeRoute = GoRoute(
    path: Pages.home.path,
    name: Pages.home.name,
    pageBuilder: (context, state) {
      return getCustomTransition(
        TransitionDetails(
          context: context,
          state: state,
          page: const HomePage(),
          name: Pages.home.name,
          transition: Transitions.slideLeftToRight,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.easeInToLinear,
        ),
      );
    },
    routes: [
      _pageOneRoute,
    ],
  );

  // Will not be initialized before using it.
  // All routes will be initialized before.
  late final _router = GoRouter(
    initialLocation: Pages.splash.path,
    routes: [
      _splashRoute,
      _onBoardingRoute,
      _loginRoute,
      _homeRoute,
    ],
    redirect: _redirect,
    refreshListenable: AuthState(),
  );

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) async {
    final authState = AuthState();
    if (authState.isLoggedIn) {
      return null;
    } else {
      return Pages.login.path;
    }
  }

  Future<T?> pushNamed<T extends Object?>(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
    Transitions? transition,
  }) async {
    if (transition != null) {
      _ref.read(transitionProvider.notifier).state = transition;
    }
    return await GoRouter.of(context).pushNamed<T>(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
