import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_machine_test/controller/auth_controller.dart';
import 'package:ecommerce_machine_test/view/auth/auth_screen.dart';
import 'package:ecommerce_machine_test/view/home/home.dart';
import 'package:ecommerce_machine_test/widgets/loading_indicator.dart';
import 'package:ecommerce_machine_test/widgets/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User get user => auth.currentUser!;
  static FirebaseFirestore get firestore => FirebaseFirestore.instance;

  static Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // Display a loading dialog

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user exists and is authenticated
      if (userCredential.user != null) {
        // Ensure that context is still valid before accessing it
        if (!context.mounted) return;

        // Dismiss the loading dialog

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            text: "Login Successful",
            isError: false,
            context: context,
          ),
        );

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
        Provider.of<AuthProviderCtr>(context, listen: false).clear();
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific exceptions
      String message = "";

      switch (e.code) {
        case 'auth/user-not-found':
          message = 'No user found for that email.';
          break;
        case 'auth/wrong-password':
          message = 'Wrong password provided.';
          break;
        case 'invalid-credential':
          message = 'Invalid email address or password.';
          break;
        case 'auth/user-disabled':
          message = 'User account has been disabled.';
          break;
        default:
          message = 'An unknown error occurred. Please try again later.';
      }

      // Ensure that context is still valid before accessing it
      if (!context.mounted) return;

      // Dismiss the loading dialog

      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          text: message,
          isError: true,
          context: context,
        ),
      );
      Provider.of<AuthProviderCtr>(context, listen: false).clear();
    } catch (e) {
      // Handle any other exceptions
      if (kDebugMode) {
        print(e);
      }

      // Ensure that context is still valid before accessing it
      if (!context.mounted) return;

      // Show a generic error message
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          text: "An unexpected error occurred. Please try again later.",
          isError: true,
          context: context,
        ),
      );
    }
  }

  static Future<void> register({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      showLoadingDialog(context, "Registering User");
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(name);
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'id': userCredential.user!.uid,
      });

      if (!context.mounted) return;
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          text: "Registration Successfull You can now Log in!",
          isError: false,
          context: context));

      Provider.of<AuthProviderCtr>(context, listen: false)
          .toggleSignInLoginPage();
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? "";

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(text: message, isError: true, context: context));
      Navigator.pop(context);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Navigator.pop(context);
    }
  }

  static Future<void> logout({
    required BuildContext context,
  }) async {
    try {
      await auth.signOut();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          text: "Logout Success!", isError: false, context: context));
      Navigator.of(context).pushReplacementNamed(AuthScreen.route);
    } on FirebaseAuthException catch (e) {
      customSnackBar(text: e.message ?? "", isError: true, context: context);
      Navigator.pop(context);
    }
  }
}
