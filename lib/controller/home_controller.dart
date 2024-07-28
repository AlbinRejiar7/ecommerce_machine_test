import 'dart:developer';

import 'package:ecommerce_machine_test/model/product.dart';
import 'package:ecommerce_machine_test/server/service/api_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final remoteConfig = FirebaseRemoteConfig.instance;
  TextEditingController searchCtr = TextEditingController();

  HomeProvider() {
    _init();
    searchCtr.addListener(_onSearchChanged);
  }

  var listOfProducts = <Product>[];
  var filteredProducts = <Product>[];
  bool _isLoading = false;
  List<String?> categories = [];
  String? selectedCategory;

  static const String sortPriceHighToLow = 'Price High to Low';
  static const String sortPriceLowToHigh = 'Price Low to High';
  String? selectedSortOption;

  bool get isLoading => _isLoading;

  bool _isDiscountedPriceVisible = true;

  bool get isDiscountedPriceVisible => _isDiscountedPriceVisible;

  Future<void> _init() async {
    await fetchProducts();
    await onInitRemoteConfig();
    notifyListeners();
  }

  Future<void> onInitRemoteConfig() async {
    await remoteConfig.setDefaults({
      'isDiscountedPriceVisible': true,
    });

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10)));

    await remoteConfig.fetchAndActivate();

    _isDiscountedPriceVisible =
        remoteConfig.getBool('isDiscountedPriceVisible');

    // Listen for remote config updates
    remoteConfig.onConfigUpdated.listen(
      (event) async {
        await remoteConfig.activate();

        _isDiscountedPriceVisible =
            remoteConfig.getBool('isDiscountedPriceVisible');

        notifyListeners();
      },
    );
  }

  Future<void> fetchProducts() async {
    _setLoading(true);
    try {
      var productResponse = await ApiService.fetchProducts();
      if (productResponse != null) {
        listOfProducts = productResponse.products ?? [];
        categories = _extractCategories(listOfProducts);
        filterProducts();
      } else {
        log("PRODUCT IS EMPTY");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<String?> _extractCategories(List<Product> products) {
    return products.map((product) => product.category).toSet().toList();
  }

  void selectCategory(String? category) {
    selectedCategory = category;
    filterProducts();
  }

  void selectSortOption(String? sortOption) {
    selectedSortOption = sortOption;
    filterProducts();
  }

  void filterProducts() {
    String searchQuery = searchCtr.text.toLowerCase();

    if (selectedCategory == null || selectedCategory!.isEmpty) {
      filteredProducts = listOfProducts;
    } else {
      filteredProducts = listOfProducts
          .where((product) => product.category == selectedCategory)
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((product) =>
              (product.title?.toLowerCase().contains(searchQuery) ?? false) ||
              (product.description?.toLowerCase().contains(searchQuery) ??
                  false))
          .toList();
    }

    if (selectedSortOption == sortPriceHighToLow) {
      filteredProducts.sort((a, b) => b.price?.compareTo(a.price ?? 0) ?? 0);
    } else if (selectedSortOption == sortPriceLowToHigh) {
      filteredProducts.sort((a, b) => a.price?.compareTo(b.price ?? 0) ?? 0);
    }

    notifyListeners();
  }

  void _onSearchChanged() {
    filterProducts();
  }

  @override
  void dispose() {
    searchCtr.removeListener(_onSearchChanged);
    searchCtr.dispose();
    super.dispose();
  }
}
