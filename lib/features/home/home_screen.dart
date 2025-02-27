import 'package:flutter/material.dart';
import 'package:payment_gateways_app/providers/auth_provider.dart';
import 'package:payment_gateways_app/services/auth.dart';
import 'package:payment_gateways_app/services/payments.dart';
import 'package:provider/provider.dart';

import '../../providers/payment_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Payment Gateway', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => _processPayment(
                    context,
                    PaymentGateway.paypal,
                    paymentProvider,
                  ),
              child: Text('Pay with PayPal'),
            ),
            ElevatedButton(
              onPressed:
                  () => _processPayment(
                    context,
                    PaymentGateway.stripe,
                    paymentProvider,
                  ),
              child: Text('Pay with Stripe'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed:
                  () =>
                      Provider.of<AuthProvider>(
                        context,
                        listen: false,
                      ).signOut(),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment(
    BuildContext context,
    PaymentGateway service,
    PaymentProvider provider,
  ) async {
    if (service == PaymentGateway.stripe) {
      provider.selectGateway(PaymentGateway.stripe);

      var result = await provider.pay(100.0);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result ?? "Payment Failed")));
    } else if (service == PaymentGateway.paypal) {
      provider.selectGateway(PaymentGateway.paypal);

      var result = await provider.pay(280.0);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result ?? "Payment Failed")));
    }
  }
}
