import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_state.dart';
import '../shared_preferences_manager.dart';

class HomePage extends ConsumerWidget {
  static const String path = '/';
  static const String name = 'Home-Screen';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(sharedPreferencesManagerProvider).setLoggedOut();
            AuthState().signOut();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
