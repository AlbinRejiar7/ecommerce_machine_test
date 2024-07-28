import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/controller/home_controller.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final void Function(String) onFilterSelected;
  final String currentSelectedFilter;

  const FilterBottomSheet({
    super.key,
    required this.onFilterSelected,
    required this.currentSelectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sort By',
            style: Theme.of(context).primaryTextTheme.bodyLarge,
          ),
          ListTile(
            title: Text(HomeProvider.sortPriceLowToHigh,
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                      color: currentSelectedFilter ==
                              HomeProvider.sortPriceLowToHigh
                          ? kBlue
                          : kBlack,
                    )),
            trailing: currentSelectedFilter == HomeProvider.sortPriceLowToHigh
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
            onTap: () {
              onFilterSelected(HomeProvider.sortPriceLowToHigh);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(HomeProvider.sortPriceHighToLow,
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                      color: currentSelectedFilter ==
                              HomeProvider.sortPriceHighToLow
                          ? kBlue
                          : kBlack,
                    )),
            trailing: currentSelectedFilter == HomeProvider.sortPriceHighToLow
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
            onTap: () {
              onFilterSelected(HomeProvider.sortPriceHighToLow);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

void showFilterBottomSheet(
    {required BuildContext context,
    required void Function(String) onFilterSelected,
    required String currentSelectedFilter}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return FilterBottomSheet(
        onFilterSelected: onFilterSelected,
        currentSelectedFilter: currentSelectedFilter,
      );
    },
  );
}
