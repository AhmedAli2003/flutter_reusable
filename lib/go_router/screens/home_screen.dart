import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/app_router.dart';
import '../utils/auth_state.dart';
import '../router/page_path_and_name.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: MediaQuery.paddingOf(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.deepPurple.withOpacity(0.25),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12).copyWith(right: 4),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Page Transitions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      AuthState().signOut();
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8, bottom: 12),
                itemCount: Transitions.values.length,
                itemBuilder: (context, index) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 64),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ref.read(appRouterProvider).pushNamed(
                          context,
                          Pages.pageOne.name,
                          transition: Transitions.values[index],
                        );
                  },
                  child: Text('Transition: ${Transitions.values[index].name}'),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
