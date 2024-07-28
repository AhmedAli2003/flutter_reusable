import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared_preferences_manager.dart';
import 'login_screen.dart';

class OnBoardingScreen extends ConsumerWidget {
  static const String path = '/on-boarding';
  static const String name = 'On-Boarding-Screen';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Welcome to our app'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            ref.read(sharedPreferencesManagerProvider).setOnBoardingCompleted();
            context.goNamed(LoginScreen.name);
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
