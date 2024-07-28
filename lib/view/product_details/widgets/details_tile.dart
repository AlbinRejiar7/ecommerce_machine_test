import 'package:ecommerce_machine_test/model/product.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:ecommerce_machine_test/view/home/widgets/price_widget.dart';
import 'package:ecommerce_machine_test/view/product_details/widgets/custom_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CustomDetailsTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${product.title}",
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
          kHeight(10.h),
          Text(
            "${product.description}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          kHeight(10.h),
          PriceWidget(
            isDetailsScreen: true,
            originalPrice: product.price ?? 0,
            discountPercentage: product.discountPercentage,
          ),
          kHeight(5.h),
          Text(
            "${product.shippingInformation}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          kHeight(5.h),
          Text(
            "${product.warrantyInformation}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
