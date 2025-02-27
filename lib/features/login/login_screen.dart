import 'package:flutter/material.dart';
import 'package:payment_gateways_app/features/home/home_screen.dart';
import 'package:payment_gateways_app/locator.dart';
import 'package:payment_gateways_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context, String service) async {
    final authService = getIt<AuthService>();
    if (service == "email") {
      setupLocator(service);
      authService.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } else if (service == "facebook") {
      setupLocator(service);
      authService.signIn();
    } else if (service == "google") {
      setupLocator(service);
      authService.signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context, 'email'),
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context, 'google'),
              child: Text('Login with Google'),
            ),
            ElevatedButton(
              onPressed: () => _login(context, 'facebook'),
              child: Text('Login with Facebook'),
            ),
          ],
        ),
      ),
    );
  }
}
