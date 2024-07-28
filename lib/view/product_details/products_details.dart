import 'package:ecommerce_machine_test/constants/padding.dart';
import 'package:ecommerce_machine_test/controller/product_details.dart';
import 'package:ecommerce_machine_test/model/product.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:ecommerce_machine_test/view/product_details/widgets/details_tile.dart';
import 'package:ecommerce_machine_test/view/product_details/widgets/product_tile.dart';
import 'package:ecommerce_machine_test/view/product_details/widgets/products_page_view.dart';
import 'package:ecommerce_machine_test/view/product_details/widgets/reviews.dart';
import 'package:ecommerce_machine_test/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({
    super.key,
  });
  static const String route = '/details';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    var productCtr = Provider.of<ProductDetailsProvider>(context);
    return Scaffold(
      appBar: const CommonAppbar(
        isSearchBar: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: CommonPadding.p1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPageViewBuilder(productCtr: productCtr, product: product),
              kHeight(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.minimumOrderQuantity}+ People Ordered this",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "${product.availabilityStatus}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              kHeight(10.h),
              DetailsTile(product: product),
              kHeight(10.h),
              CustomTileforProductInfo(
                  title: "Estimated Time of Arrival",
                  subtitle: product.shippingInformation ?? ""),
              kHeight(10.h),
              CustomTileforProductInfo(
                  title: "Warranty",
                  subtitle: product.warrantyInformation ?? ""),
              kHeight(10.h),
              CustomTileforProductInfo(
                  title: "Return Policy", subtitle: product.returnPolicy ?? ""),
              kHeight(10.h),
              Text(
                "Ratings & reviews",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              kHeight(7.h),
              reviewListBuilder(product),
            ],
          ),
        ),
      ),
    );
  }
}
