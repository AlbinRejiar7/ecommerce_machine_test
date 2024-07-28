import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/icons.dart';
import 'package:ecommerce_machine_test/model/product.dart';
import 'package:ecommerce_machine_test/view/product_details/widgets/custom_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ListView reviewListBuilder(Product product) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: product.reviews?.length,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      var local = product.reviews?[index];
      return Padding(
        padding: EdgeInsets.only(bottom: 8.w),
        child: CustomDetailsTile(
          padding: 0,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  local?.reviewerName ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  local?.reviewerEmail ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            subtitle: Text(
              local?.comment ?? "",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  AppIcons.star,
                  color: kGreen,
                ),
                Text(
                  local?.rating.toString() ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
