//PAYMENTS MODULE

abstract class PaymentGateway {
  Future<String> initiatePayment(double amount);
  Future<bool> verifyPayment(String transactionId);
}

class StripePayment implements PaymentGateway {
  @override
  Future<String> initiatePayment(double amount) async {
    // Call Stripe API
    return "stripe_txn_123";
  }

  @override
  Future<bool> verifyPayment(String transactionId) async {
    // Verify with Stripe API
    return true;
  }
}

class PayPalPayment implements PaymentGateway {
  @override
  Future<String> initiatePayment(double amount) async {
    // Call PayPal API
    return "paypal_txn_456";
  }

  @override
  Future<bool> verifyPayment(String transactionId) async {
    // Verify with PayPal API
    return true;
  }
}

class PaymentFactory {
  static PaymentGateway getPaymentGateway(String provider) {
    switch (provider) {
      case 'stripe':
        return StripePayment();
      case 'paypal':
        return PayPalPayment();
      default:
        throw Exception("Payment provider not supported");
    }
  }
}
