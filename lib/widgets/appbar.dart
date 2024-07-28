import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/icons.dart';
import 'package:ecommerce_machine_test/controller/home_controller.dart';
import 'package:ecommerce_machine_test/controller/search_controller.dart';
import 'package:ecommerce_machine_test/widgets/expandable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSearchBar;
  const CommonAppbar({
    super.key,
    this.isSearchBar = true,
  });

  @override
  Widget build(BuildContext context) {
    var ctr = Provider.of<SearchProvider>(context);
    var homeCtr = Provider.of<HomeProvider>(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBlue,
      toolbarHeight: 80.h,
      title: Text(
        "e-Shop",
        style: Theme.of(context).textTheme.labelMedium,
      ),
      actions: [
        isSearchBar
            ? ExpandableTextField(ctr: ctr, homeCtr: homeCtr)
            : const SizedBox.shrink(),
        ctr.isExpanded
            ? IconButton(
                onPressed: () {
                  ctr.toggleExpand();
                  homeCtr.searchCtr.clear();
                },
                icon: const Icon(
                  AppIcons.close,
                  color: kWhiteGrey,
                ))
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
