//PAYMENTS MODULE

abstract class PaymentGatewayService {
  Future<bool?> initiatePayment(double amount);
  Future<bool> verifyPayment(String transactionId);
}

class StripePayment implements PaymentGatewayService {
  @override
  Future<bool?> initiatePayment(double amount) async {
    // Call Stripe API
    if (amount > 0) {
      print("Pay $amount with Stripe Payment");
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> verifyPayment(String transactionId) async {
    print('Verify Payment Success');
    return true;
  }
}

class PayPalPayment implements PaymentGatewayService {
  @override
  Future<bool?> initiatePayment(double amount) async {
    if (amount > 0) {
      print("Pay $amount with Paypal Payment");
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> verifyPayment(String transactionId) async {
    // Verify with PayPal API
    print('Verify Payment Success');
    return true;
  }
}
