import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/controller/home_controller.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PriceWidget extends StatelessWidget {
  final double originalPrice;
  final double? discountPercentage;
  final bool isDetailsScreen;

  const PriceWidget({
    super.key,
    required this.originalPrice,
    this.discountPercentage,
    required this.isDetailsScreen,
  });

  @override
  Widget build(BuildContext context) {
    double? discountedPrice;
    if (discountPercentage != null && discountPercentage! > 0) {
      discountedPrice = originalPrice * (1 - discountPercentage! / 100);
    }

    final textStyle = Theme.of(context).textTheme.displaySmall?.copyWith(
          fontSize: isDetailsScreen ? 24.sp : 10.sp,
        );

    final crossedTextStyle = textStyle?.copyWith(
      color: kGrey,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 3.w,
    );

    final discountTextStyle = textStyle?.copyWith(color: kGreen);

    return Consumer<HomeProvider>(builder: (context, home, _) {
      return RichText(
        text: TextSpan(
          children: discountedPrice != null && home.isDiscountedPriceVisible
              ? [
                  TextSpan(
                    text: '\$${originalPrice.toStringAsFixed(2)}',
                    style: crossedTextStyle,
                  ),
                  WidgetSpan(child: kWidth(8.w)),
                  TextSpan(
                    text: '\$${discountedPrice.toStringAsFixed(2)}',
                    style: textStyle,
                  ),
                  WidgetSpan(child: kWidth(8.w)),
                  TextSpan(
                    text: '${discountPercentage!.toStringAsFixed(2)}% off',
                    style: discountTextStyle,
                  ),
                ]
              : [
                  TextSpan(
                    text: '\$${originalPrice.toStringAsFixed(0)}',
                    style: textStyle,
                  ),
                ],
        ),
      );
    });
  }
}
