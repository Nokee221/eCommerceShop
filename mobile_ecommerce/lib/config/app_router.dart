import 'package:flutter/material.dart';
import 'package:mobile_ecommerce/models/models.dart';
import 'package:mobile_ecommerce/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:mobile_ecommerce/screens/screens.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/signup/sign_up.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case OrderConfirmationScreen.routeName:
        return OrderConfirmationScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();



      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
      ),
    );
  }
}
