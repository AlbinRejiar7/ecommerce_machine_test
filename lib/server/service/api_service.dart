import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_machine_test/model/product.dart';
import 'package:ecommerce_machine_test/server/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<ProductResponse?> fetchProducts() async {
    var url = '${Urls.baseUrl}${Urls.prodcuts}';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return ProductResponse.fromJson(jsonResponse);
      } else {
        if (kDebugMode) {
          print('Failed to load products: ${response.statusCode}');
        }
        return null;
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('Network error: $e');
      }
      return null;
    } on FormatException catch (e) {
      if (kDebugMode) {
        print('Format error: $e');
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Unexpected error: $e');
      }
      return null;
    }
  }
}
