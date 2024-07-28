import 'package:ecommerce_machine_test/services/firebase_services.dart';
import 'package:flutter/material.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          'Do you want to log out?',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text(
              'Yes',
              style: Theme.of(context).primaryTextTheme.titleSmall,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              FirebaseServices.logout(context: context);
            },
          ),
        ],
      );
    },
  );
}
