import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/page_path_and_name.dart';
import '../shared_preferences_manager.dart';

class SplashScreen extends ConsumerStatefulWidget {
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
        context.goNamed(Pages.home.name);
      } else {
        if (!prefs.isOnBoardingCompleted()) {
          context.goNamed(Pages.onBoarding.name);
        } else {
          context.goNamed(Pages.login.name);
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
