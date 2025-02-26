import 'package:payment_gateways_app/models/user_model.dart';

//AUTHENTICATE MODULE

abstract class AuthService {
  Future<User?> signIn();
  Future<void> signOut();
  Future<User?> getCurrentUser();
}

class GoogleAuthService implements AuthService {
  @override
  Future<User?> signIn() async {
    // Google Sign-In logic
  }

  @override
  Future<void> signOut() async {
    // Sign out from Google
  }

  @override
  Future<User?> getCurrentUser() async {
    // Get Google user
  }
}

class EmailAuthService implements AuthService {
  @override
  Future<User?> signIn() async {
    // Email authentication logic
  }

  @override
  Future<void> signOut() async {
    // Logout logic
  }

  @override
  Future<User?> getCurrentUser() async {
    // Retrieve email authenticated user
  }
}
