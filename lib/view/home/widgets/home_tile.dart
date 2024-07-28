import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:ecommerce_machine_test/view/home/widgets/price_widget.dart';
import 'package:ecommerce_machine_test/widgets/shimmer_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeTile extends StatelessWidget {
  final String productImageUrl;
  final String desc;
  final double? discountPercentage;
  final double originalPrice;
  final String productName;
  final void Function()? onTap;
  const CustomHomeTile({
    super.key,
    required this.productImageUrl,
    required this.desc,
    this.discountPercentage,
    required this.originalPrice,
    required this.productName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: kWhiteGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerNetworkImage(
              fit: BoxFit.contain,
              borderRadius: BorderRadius.circular((6.w)),
              imageUrl: productImageUrl,
              height: 120.h,
              width: double.infinity,
            ),
            kHeight(8.h),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              productName,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            kHeight(5.h),
            Flexible(
              child: SizedBox(
                height: 30.h,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  desc,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            kHeight(6.h),
            PriceWidget(
                isDetailsScreen: false,
                originalPrice: originalPrice,
                discountPercentage: discountPercentage)
          ],
        ),
      ),
    );
  }
}
