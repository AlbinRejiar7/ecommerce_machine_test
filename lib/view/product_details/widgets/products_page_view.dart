import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/controller/product_details.dart';
import 'package:ecommerce_machine_test/model/product.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:ecommerce_machine_test/widgets/shimmer_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder({
    super.key,
    required this.productCtr,
    required this.product,
  });

  final ProductDetailsProvider productCtr;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 300.h,
          child: PageView.builder(
            controller: productCtr.pageController,
            itemCount: product.images?.length,
            itemBuilder: (BuildContext context, int index) {
              var image = product.images?[index];
              return ShimmerNetworkImage(
                imageUrl: image,
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        kHeight(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
                controller: productCtr.pageController,
                count: product.images?.length ?? 0,
                effect: WormEffect(
                    activeDotColor: kBlue, dotHeight: 7.h, dotWidth: 7.h),
                onDotClicked: (index) {}),
          ],
        ),
      ],
    );
  }
}
