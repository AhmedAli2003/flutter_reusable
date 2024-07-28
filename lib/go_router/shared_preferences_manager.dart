import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesManagerProvider = Provider<SharedPreferencesManager>(
  (ref) => throw UnimplementedError(),
);

class SharedPreferencesManager {
  // ignore: unused_field
  final Ref _ref;
  final SharedPreferences _sp;

  SharedPreferencesManager({
    required Ref ref,
    required SharedPreferences sharedPreferences,
  })  : _ref = ref,
        _sp = sharedPreferences;

  Future<bool> setOnBoardingCompleted() {
    return _sp.setBool('ON_BOARDING_COMPLETED', true);
  }

  bool isOnBoardingCompleted() {
    return _sp.getBool('ON_BOARDING_COMPLETED') ?? false;
  }

  Future<bool> setLoggedIn() {
    return _sp.setBool('LOGGED_IN', true);
  }

  Future<bool> setLoggedOut() {
    return _sp.setBool('LOGGED_IN', false);
  }

  bool isLoggedIn() {
    return _sp.getBool('LOGGED_IN') ?? false;
  }
}
