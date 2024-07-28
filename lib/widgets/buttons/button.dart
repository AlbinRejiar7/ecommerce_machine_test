import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(200.w, 50.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.w))),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
