import 'package:ecommerce_machine_test/constants/styles.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:flutter/gestures.dart'; // Import the gesture library
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String firstText;
  final String buttonText;
  final Function()? onButtonTextTap;

  const CustomTextWidget({
    super.key,
    required this.firstText,
    required this.buttonText,
    this.onButtonTextTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: CustomTextStyles.normalBlackText,
          ),
          WidgetSpan(child: kWidth(5.w)),
          TextSpan(
            text: buttonText,
            style: Theme.of(context).textTheme.bodyMedium,
            recognizer: TapGestureRecognizer()..onTap = onButtonTextTap,
          ),
        ],
      ),
    );
  }
}
