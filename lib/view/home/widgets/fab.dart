import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/icons.dart';
import 'package:ecommerce_machine_test/view/auth/widget/logout_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 100.w,
      child: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: kBlue,
        onPressed: () {
          showLogoutDialog(context);
        },
        label: Text(
          "Logout",
          style: Theme.of(context).primaryTextTheme.titleSmall,
        ),
        icon: const Icon(
          AppIcons.logout,
          color: kWhiteGrey,
        ),
      ),
    );
  }
}
