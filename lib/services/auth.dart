import 'package:flutter/material.dart';
import 'package:payment_gateways_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//AUTHENTICATE SERVICE

abstract class AuthService {
  Future<User?> signIn({String? email, String? password});
  Future<void> signOut();
  Future<User?> getCurrentUser();
}

class GoogleAuthService implements AuthService {
  @override
  Future<User?> signIn({String? email, String? password}) async {
    print('Login with Google');
    // Google Sign-In logic
    return null;
  }

  @override
  Future<void> signOut() async {
    // Sign out from Google
  }

  @override
  Future<User?> getCurrentUser() async {
    return null;

    // Get Google user
  }
}

class FacebookAuthService implements AuthService {
  @override
  Future<User?> signIn({String? email, String? password}) async {
    print('Login with Facebook');

    // Facebook Sign-In logic
    return null;
  }

  @override
  Future<void> signOut() async {
    // Sign out from Facebook
  }

  @override
  Future<User?> getCurrentUser() async {
    return null;

    // Get Facebook user
  }
}

class EmailAuthService implements AuthService {
  @override
  Future<User?> signIn({String? email, String? password}) async {
    // Email Sign-In logic
    print('Login with Email');

    if (email == "demo@gmail.com" && password == "123123") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', email ?? '');
      await prefs.setString('password', password ?? '');
      return User(
        email: email,
        password: password,
        name: 'Demo Account',
        phone: '0859144444',
      );
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    // Logout logic
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Future<User?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var email = prefs.getString("userEmail");
    var password = prefs.getString("password");
    if (email?.isNotEmpty == true) {
      return User(
        email: email,
        password: password,
        name: 'Demo Account',
        phone: '0859144444',
      );
    } else {
      return null;
    }

    // Retrieve email authenticated user
  }
}
