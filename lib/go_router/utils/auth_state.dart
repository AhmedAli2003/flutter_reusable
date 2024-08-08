import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  static final _instance = AuthState._internal();

  factory AuthState() => _instance;

  AuthState._internal();

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void signIn() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void signOut() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
