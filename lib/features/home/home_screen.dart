import 'package:flutter/material.dart';
import 'package:payment_gateways_app/locator.dart';
import 'package:payment_gateways_app/services/auth.dart';
import 'package:payment_gateways_app/services/payments.dart';

class HomeScreen extends StatelessWidget {
  void _processPayment(String service) async {
    final paymentService = getIt<PaymentGatewayService>();
    if (service == "paypal") {
      setupLocator(service);
      var isInitSuccess = await paymentService.initiatePayment(100.0);
      if (isInitSuccess == true) {
        paymentService.verifyPayment(service);
      }
    } else if (service == "stripe") {
      setupLocator(service);
      var isInitSuccess = await paymentService.initiatePayment(620.5);
      if (isInitSuccess == true) {
        paymentService.verifyPayment(service);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Payment Gateway', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _processPayment('paypal'),
              child: Text('Pay with PayPal'),
            ),
            ElevatedButton(
              onPressed: () => _processPayment('stripe'),
              child: Text('Pay with Stripe'),
            ),
          ],
        ),
      ),
    );
  }
}
