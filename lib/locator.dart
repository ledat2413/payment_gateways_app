import 'package:get_it/get_it.dart';
import 'package:payment_gateways_app/services/auth.dart';
import 'package:payment_gateways_app/services/payments.dart';

final getIt = GetIt.instance;

void setupLocator(String service) {
  if (service == 'stripe') {
    getIt.registerSingleton<PaymentGatewayService>(StripePayment());
  } else if (service == 'paypal') {
    getIt.registerSingleton<PaymentGatewayService>(PayPalPayment());
  } else if (service == 'google') {
    getIt.registerSingleton<AuthService>(GoogleAuthService());
  } else if (service == 'facebook') {
    getIt.registerSingleton<AuthService>(FacebookAuthService());
  } else if (service == 'email') {
    getIt.registerSingleton<AuthService>(EmailAuthService());
  }
}
