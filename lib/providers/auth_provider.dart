import 'package:flutter/material.dart';
import 'package:payment_gateways_app/models/user_model.dart';
import 'package:payment_gateways_app/services/auth.dart';
import 'package:payment_gateways_app/services/payments.dart';

enum AuthenticateType { email, google, facebook }

class AuthProvider with ChangeNotifier {
  AuthService? _authService;

  void selectAuth(AuthenticateType service) {
    if (service == AuthenticateType.email) {
      _authService = EmailAuthService();
    } else if (service == AuthenticateType.facebook) {
      _authService = FacebookAuthService();
    } else if (service == AuthenticateType.google) {
      _authService = GoogleAuthService();
    }

    notifyListeners();
  }

  Future<User?> signIn({String? email, String? password}) async {
    return await _authService?.signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    await _authService?.signOut();
  }

  Future<User?> getCurrentUser() async {
    return await _authService?.getCurrentUser();
  }
}
