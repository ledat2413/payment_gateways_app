import 'package:flutter/material.dart';
import 'package:payment_gateways_app/features/home/home_screen.dart';
import 'package:payment_gateways_app/providers/auth_provider.dart';
import 'package:payment_gateways_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AuthProvider authProvider; 
    late BuildContext _context;


  @override
void didChangeDependencies() {
  super.didChangeDependencies();
  
  // Use dependOnInheritedWidgetOfExactType to safely access inherited widgets
   _context = context;
  // Use the `theme` or any context-related operation here
}

@override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);

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
             Row(
               children: [
                 Expanded(
                   child: ElevatedButton(
                    onPressed:
                        () => _login(context, AuthenticateType.firebase, authProvider),
                    child: Text('Login with Firebase'),
                               ),
                 ),
                  SizedBox(width: 20),
                   Expanded(
                     child: ElevatedButton(
                                       onPressed:
                        () => _register(AuthenticateType.firebase, authProvider),
                                       child: Text('Register with Firebase'),
                               ),
                   ),           
               ],
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

  @override
  void dispose() {
    super.dispose();
  }


  void _register(
  
    AuthenticateType service,
    AuthProvider? provider,
  ) async {
    if (service == AuthenticateType.firebase) {
      provider?.selectAuth(service);
      var result = await provider?.register(email: _emailController.text, password: _passwordController.text);
      if (result != null){
          ScaffoldMessenger.of(_context).showSnackBar(SnackBar(content: Text('Registration Successful!')));

      }else {
          ScaffoldMessenger.of(_context).showSnackBar(SnackBar(content: Text('Registration Failed')));

      }
    }
  }  

  void _login(
    BuildContext context,
    AuthenticateType service,
    AuthProvider? provider,
  ) async {
    if (service == AuthenticateType.email) {
      provider?.selectAuth(AuthenticateType.email);
      var result = await provider?.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed!')));
      }
    } else if (service == AuthenticateType.facebook) {
      provider?.selectAuth(AuthenticateType.facebook);
      provider?.signIn();
    } else if (service == AuthenticateType.google) {
      provider?.selectAuth(AuthenticateType.google);
      provider?.signIn();
    }else if (service == AuthenticateType.firebase){
        provider?.selectAuth(AuthenticateType.firebase);
        var result = await provider?.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login with Firebase Failed!')));
      }else {
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }
}

