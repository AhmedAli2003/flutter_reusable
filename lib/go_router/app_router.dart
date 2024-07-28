import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth_state.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/on_boarding_screen.dart';
import 'screens/splash_screen.dart';
import 'transitions.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(ref: ref));

class AppRouter {
  // ignore: unused_field
  final Ref _ref;

  AppRouter({required Ref ref}) : _ref = ref;

  // The getter that will be called
  GoRouter get router => _router;

  // We should always use pageBuilder to make sure that all animations work properly
  final _splashRoute = GoRoute(
    path: SplashScreen.path,
    name: SplashScreen.name,
    pageBuilder: (context, state) => const NoTransitionPage(
      name: SplashScreen.name,
      child: SplashScreen(),
    ),
  );

  final _onBoardingRoute = GoRoute(
    path: OnBoardingScreen.path,
    name: OnBoardingScreen.name,
    pageBuilder: (context, state) {
      return getCustomTransition(
        TransitionDetails(
          context: context,
          state: state,
          page: const OnBoardingScreen(),
          name: OnBoardingScreen.name,
          transition: Transitions.slideLeftToRight,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.easeInToLinear,
        ),
      );
    },
  );

  final _loginRoute = GoRoute(
    path: LoginScreen.path,
    name: LoginScreen.name,
    pageBuilder: (context, state) {
      return getCustomTransition(
        TransitionDetails(
          context: context,
          state: state,
          page: const LoginScreen(),
          name: LoginScreen.name,
          transition: Transitions.slideLeftToRight,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.easeInToLinear,
        ),
      );
    },
  );

  final _homeRoute = GoRoute(
    path: HomePage.path,
    name: HomePage.name,
    pageBuilder: (context, state) {
      return getCustomTransition(
        TransitionDetails(
          context: context,
          state: state,
          page: const HomePage(),
          name: HomePage.name,
          transition: Transitions.slideLeftToRight,
          curve: Curves.fastLinearToSlowEaseIn,
          reverseCurve: Curves.easeInToLinear,
        ),
      );
    },
  );

  // Will not be initialized before using it.
  // All routes will be initialized before.
  late final _router = GoRouter(
    initialLocation: SplashScreen.path,
    routes: [
      _splashRoute,
      _onBoardingRoute,
      _loginRoute,
      _homeRoute,
    ],
    redirect: _redirect,
    refreshListenable: AuthState(),
  );

  static const List<String> _screens = [SplashScreen.path, OnBoardingScreen.path];

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) async {
    if (_screens.contains(state.matchedLocation)) {
      return null;
    }

    final authState = AuthState();

    if (authState.isLoggedIn) {
      return HomePage.path;
    } else {
      return LoginScreen.path;
    }
  }
}
