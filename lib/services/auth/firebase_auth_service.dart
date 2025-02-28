import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payment_gateways_app/models/user_model.dart';
import 'package:payment_gateways_app/services/auth/auth_service.dart';

class FirebaseAuthService implements AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
       final UserCredential userCredential = await _auth.getRedirectResult(
      );
      return UserModel(email: userCredential.user?.email,name: userCredential.user?.email,);
    } catch (e) {
      return null;
    }
    
  }

  @override
  Future<UserModel?> signIn({String? email, String? password})async {
     try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );
      print("User signed in: ${userCredential.user?.email}");
      return UserModel(email: email,name: userCredential.user?.email ?? '',);
    } catch (e) {
      print("Login failed: $e");
      return UserModel();
    }
  }

   @override
  Future<UserModel?> register({required String email,required String password}) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password:password,
      );
      print("User registered: ${userCredential.user?.email}");
      return  UserModel(email: email,name:userCredential.user?.displayName);
    } catch (e) {
      print("Registration failed: $e");
      return UserModel();
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  } 

}