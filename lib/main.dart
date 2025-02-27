import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:payment_gateways_app/features/home/home_screen.dart';
import 'package:payment_gateways_app/features/login/login_screen.dart';
import 'package:payment_gateways_app/models/user_model.dart';
import 'package:payment_gateways_app/providers/auth_provider.dart';
import 'package:payment_gateways_app/providers/payment_provider.dart';
import 'package:payment_gateways_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<User?>(
        future: authProvider.getCurrentUser(),
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
