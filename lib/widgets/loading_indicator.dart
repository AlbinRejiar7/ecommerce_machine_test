import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showLoadingDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              color: kBlue,
            ),
            kWidth(20.w),
            Flexible(
              child: Text(
                message,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      );
    },
  );
}
