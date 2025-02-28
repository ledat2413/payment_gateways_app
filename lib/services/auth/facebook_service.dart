import 'package:payment_gateways_app/models/user_model.dart';
import 'package:payment_gateways_app/services/auth/auth_service.dart';

class FacebookAuthService implements AuthService {
  @override
  Future<UserModel?> signIn({String? email, String? password}) async {
    print('Login with Facebook');

    // Facebook Sign-In logic
    return null;
  }

  @override
  Future<void> signOut() async {
    // Sign out from Facebook
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    return null;

    // Get Facebook user
  }
  
  @override
  Future<UserModel?> register({required String? email,required String? password }) async {
        //To Do register

    return null;
  
  }
}