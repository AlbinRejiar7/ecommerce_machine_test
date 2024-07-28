import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/icons.dart';
import 'package:ecommerce_machine_test/constants/images.dart';
import 'package:ecommerce_machine_test/controller/home_controller.dart';
import 'package:ecommerce_machine_test/services/firebase_services.dart';
import 'package:ecommerce_machine_test/utils/capitalise.dart';
import 'package:ecommerce_machine_test/utils/sized_box.dart';
import 'package:ecommerce_machine_test/view/home/widgets/fab.dart';
import 'package:ecommerce_machine_test/view/home/widgets/home_tile.dart';
import 'package:ecommerce_machine_test/view/home/widgets/shimmer_loading.dart';
import 'package:ecommerce_machine_test/view/product_details/products_details.dart';
import 'package:ecommerce_machine_test/widgets/appbar.dart';
import 'package:ecommerce_machine_test/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = "/home";
  @override
  Widget build(BuildContext context) {
    var homeCtr = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: const CommonAppbar(),
      floatingActionButton: const CustomFAB(),
      body: SingleChildScrollView(
        child: Consumer<HomeProvider>(builder: (context, home, _) {
          return homeCtr.isLoading
              ? const ShimmerGrid()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight(5.h),
                      Row(
                        children: [
                          Wrap(
                            spacing: 8.w,
                            children: homeCtr.categories.map((category) {
                              final isSelected =
                                  homeCtr.selectedCategory == category;
                              return FilterChip(
                                backgroundColor: kWhiteGrey,
                                selectedColor: kBlue,
                                surfaceTintColor: kWhiteGrey,
                                checkmarkColor: kWhiteGrey,
                                elevation: 3,
                                labelPadding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(
                                        color: Colors.transparent)),
                                label: Text(
                                  capitalize(category ?? ""),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: isSelected ? kWhiteGrey : kBlack,
                                      ),
                                ),
                                selected: homeCtr.selectedCategory == category,
                                onSelected: (isSelected) {
                                  homeCtr.selectCategory(
                                      isSelected ? category : null);
                                },
                              );
                            }).toList(),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  showFilterBottomSheet(
                                      context: context,
                                      onFilterSelected: (value) {
                                        homeCtr.selectSortOption(value);
                                      },
                                      currentSelectedFilter:
                                          homeCtr.selectedSortOption ?? "");
                                },
                                icon: const Icon(AppIcons.filter)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hi ${capitalize(FirebaseServices.user.displayName ?? "")},",
                          style: Theme.of(context).primaryTextTheme.bodyLarge,
                        ),
                      ),
                      Consumer<HomeProvider>(builder: (context, home, _) {
                        return home.filteredProducts.isEmpty
                            ? Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.w),
                                  child: Image.asset(
                                    noProduct,
                                    height: 300.h,
                                    width: 300.h,
                                  ),
                                ),
                              )
                            : GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(bottom: 90.h),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10.h,
                                        crossAxisSpacing: 10.h,
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7.w),
                                itemCount: homeCtr.filteredProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var localProducts =
                                      homeCtr.filteredProducts[index];
                                  return Consumer<HomeProvider>(
                                      builder: (context, home, _) {
                                    return CustomHomeTile(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            ProductsDetailsScreen.route,
                                            arguments: localProducts);
                                      },
                                      productImageUrl:
                                          localProducts.thumbnail ?? "",
                                      desc: localProducts.description ?? "",
                                      originalPrice: localProducts.price ?? 0,
                                      productName: localProducts.title ?? "",
                                      discountPercentage:
                                          localProducts.discountPercentage,
                                    );
                                  });
                                },
                              );
                      }),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
