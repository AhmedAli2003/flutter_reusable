import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth_state.dart';
import '../router/page_path_and_name.dart';
import '../shared_preferences_manager.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthState().signIn();
            ref.read(sharedPreferencesManagerProvider).setLoggedIn();
            // ref.read(goToAnotherPageInAppProvider.notifier).state = true;
            GoRouter.of(context).goNamed(Pages.home.name);
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
