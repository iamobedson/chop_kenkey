// ignore_for_file: no_duplicate_case_values, avoid_print

import 'package:chop_kenkey/screens/cart_screen.dart';
import 'package:chop_kenkey/screens/confirm_order.dart';
import 'package:chop_kenkey/screens/dashboard.dart';
import 'package:chop_kenkey/screens/catalog.dart';
import 'package:chop_kenkey/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:chop_kenkey/models/models.dart';
import 'package:chop_kenkey/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case Login.routeName:
        return Login.route();
      case Dashboard.routeName:
        return Dashboard.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case Reset.routeName:
        return Reset.route();
      case Profile.routeName:
        return Profile.route();
      case SignUp.routeName:
        return SignUp.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case ConfirmOrder.routeName:
        return ConfirmOrder.route();
      default:
        return Login.route();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
