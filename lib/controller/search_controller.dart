import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  var isExpanded = false;

  void toggleExpand() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
