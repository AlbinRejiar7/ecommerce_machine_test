import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/icons.dart';
import 'package:ecommerce_machine_test/controller/home_controller.dart';
import 'package:ecommerce_machine_test/controller/search_controller.dart';
import 'package:ecommerce_machine_test/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExpandableTextField extends StatelessWidget {
  const ExpandableTextField({
    super.key,
    required this.ctr,
    required this.homeCtr,
  });

  final SearchProvider ctr;
  final HomeProvider homeCtr;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, srch, _) {
      return AnimatedContainer(
        duration: Durations.medium2,
        margin: EdgeInsets.only(right: 10.w),
        curve: Curves.easeIn,
        height: 40.h,
        width: ctr.isExpanded ? 230.w : 40.h,
        decoration: BoxDecoration(
            color: kLightGrey, borderRadius: BorderRadius.circular(30)),
        child: ctr.isExpanded
            ? Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                        controller: homeCtr.searchCtr,
                        hintText: "search your product",
                        isBoarder: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Icon(AppIcons.searchRounded),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () => ctr.toggleExpand(),
                child: const Icon(AppIcons.searchRounded)),
      );
    });
  }
}
