import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDetailsTile extends StatelessWidget {
  final Widget child;
  final double? padding;
  const CustomDetailsTile({
    super.key,
    required this.child,
    this.padding = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding!.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        color: kWhiteGrey,
      ),
      child: child,
    );
  }
}
