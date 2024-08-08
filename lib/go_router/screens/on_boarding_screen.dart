import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/page_path_and_name.dart';
import '../utils/shared_preferences_manager.dart';

class OnBoardingScreen extends ConsumerWidget {
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
            context.goNamed(Pages.login.name);
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
