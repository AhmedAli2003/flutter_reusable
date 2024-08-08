import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'go_router/router/app_router.dart';
import 'go_router/utils/shared_preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesManagerProvider.overrideWith(
          (ref) => SharedPreferencesManager(
            ref: ref,
            sharedPreferences: sharedPreferences,
          ),
        ),
      ],
      child: const GoRouterApp(),
    ),
  );
}

class GoRouterApp extends ConsumerWidget {
  const GoRouterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'GoRouter Project',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(appRouterProvider).router,
    );
  }
}
