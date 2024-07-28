import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar({
  required String text,
  required bool isError,
  required BuildContext context,
  Duration? duration,
}) {
  return SnackBar(
    behavior: SnackBarBehavior.fixed,
    duration: duration ?? const Duration(seconds: 3),
    content: Text(
      text,
      style: Theme.of(context).primaryTextTheme.titleSmall,
    ),
    backgroundColor: isError ? kRed : kGreen,
  );
}
