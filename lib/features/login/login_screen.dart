import 'package:flutter/material.dart';
import 'package:payment_gateways_app/features/home/home_screen.dart';
import 'package:payment_gateways_app/providers/auth_provider.dart';
import 'package:payment_gateways_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
              onPressed:
                  () => _login(context, AuthenticateType.email, authProvider),
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => _login(context, AuthenticateType.google, authProvider),
              child: Text('Login with Google'),
            ),
            ElevatedButton(
              onPressed:
                  () =>
                      _login(context, AuthenticateType.facebook, authProvider),
              child: Text('Login with Facebook'),
            ),
          ],
        ),
      ),
    );
  }

  void _login(
    BuildContext context,
    AuthenticateType service,
    AuthProvider provider,
  ) async {
    if (service == AuthenticateType.email) {
      provider.selectAuth(AuthenticateType.email);
      var result = await provider.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {}
    } else if (service == AuthenticateType.facebook) {
      provider.selectAuth(AuthenticateType.facebook);
      provider.signIn();
    } else if (service == AuthenticateType.google) {
      provider.selectAuth(AuthenticateType.google);
      provider.signIn();
    }
  }
}
