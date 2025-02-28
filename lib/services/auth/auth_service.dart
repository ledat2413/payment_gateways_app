import 'package:flutter/material.dart';
import 'package:payment_gateways_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//AUTHENTICATE SERVICE

abstract class AuthService {
  Future<UserModel?> signIn({String? email, String? password});
  Future<void> signOut();
  Future<UserModel?> register({required String email,required String password });
  Future<UserModel?> getCurrentUser();
}


class EmailAuthService implements AuthService {
  @override
  Future<UserModel?> signIn({String? email, String? password}) async {
    // Email Sign-In logic
    print('Login with Email');

    if (email == "demo@gmail.com" && password == "123123") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', email ?? '');
      await prefs.setString('password', password ?? '');
      return UserModel(
        email: email,
        name: 'Demo Account',
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
  Future<UserModel?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var email = prefs.getString("userEmail");
    var password = prefs.getString("password");
    if (email?.isNotEmpty == true) {
      return UserModel(
        email: email,
        name: 'Demo Account',
      );
    } else {
      return null;
    }
  }
  
  @override
  Future<UserModel?> register({required String? email,required String? password }) async {
        //To Do register

    return null;
  
  }
}
