import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_state.dart';
import '../shared_preferences_manager.dart';

class LoginScreen extends ConsumerWidget {
  static const String path = '/login';
  static const String name = 'Login-Screen';

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
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
