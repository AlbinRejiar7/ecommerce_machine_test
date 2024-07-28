import 'package:ecommerce_machine_test/view/product_details/widgets/custom_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTileforProductInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomTileforProductInfo({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDetailsTile(
        padding: 0,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ));
  }
}
