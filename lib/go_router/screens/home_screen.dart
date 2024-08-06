import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth_state.dart';
import '../router/page_path_and_name.dart';
import '../shared_preferences_manager.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(Pages.pageOne.name);
              },
              child: const Text('Go To Page 1'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(Pages.pageTwo.name);
              },
              child: const Text('Go To Page 2'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(sharedPreferencesManagerProvider).setLoggedOut();
                AuthState().signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
