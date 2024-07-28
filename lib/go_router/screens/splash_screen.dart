import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared_preferences_manager.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String name = 'Splash-Screen';
  static const String path = '/splash-screen';
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final seconds = Random().nextInt(3) + 1;
    Future.delayed(Duration(seconds: seconds), () {
      final prefs = ref.read(sharedPreferencesManagerProvider);
      final isLoggedIn = prefs.isLoggedIn();
      if (isLoggedIn) {
        context.goNamed(HomePage.name);
      } else {
        if (!prefs.isOnBoardingCompleted()) {
          context.goNamed(OnBoardingScreen.name);
        } else {
          context.goNamed(LoginScreen.name);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
