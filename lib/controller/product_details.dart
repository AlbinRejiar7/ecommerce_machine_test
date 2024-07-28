import 'package:flutter/material.dart';

class ProductDetailsProvider with ChangeNotifier {
  PageController pageController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}
