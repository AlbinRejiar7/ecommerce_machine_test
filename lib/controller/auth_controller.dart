import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthProviderCtr with ChangeNotifier {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  bool isVisible = false;

  void toggleVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  bool isSignInPage = false;
  void toggleSignInLoginPage() {
    isSignInPage = !isSignInPage;
    notifyListeners();
  }

  void clear() {
    nameCtr.clear();
    emailCtr.clear();
    passwordCtr.clear();
  }

  @override
  void dispose() {
    super.dispose();
    nameCtr.dispose();
    emailCtr.dispose();
    passwordCtr.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
