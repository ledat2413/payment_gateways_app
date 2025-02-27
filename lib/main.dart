import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:payment_gateways_app/features/home/home_screen.dart';
import 'package:payment_gateways_app/features/login/login_screen.dart';
import 'package:payment_gateways_app/locator.dart';
import 'package:payment_gateways_app/models/user_model.dart';
import 'package:payment_gateways_app/services/auth.dart';

void main() {
  setupLocator('email');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = getIt<AuthService>();

    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<User?>(
        future: authService.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
