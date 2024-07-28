import 'package:ecommerce_machine_test/view/auth/auth_screen.dart';
import 'package:ecommerce_machine_test/view/home/home.dart';
import 'package:ecommerce_machine_test/view/product_details/products_details.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthScreen.route: (context) => const AuthScreen(),
      HomeScreen.route: (context) => const HomeScreen(),
      ProductsDetailsScreen.route: (context) => const ProductsDetailsScreen(),
    };
  }
}
