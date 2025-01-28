import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';

abstract class ProductsLocalDataSource {
  Future<List<Product>?> getCachedProducts(String categoryId);
  Future<void> cacheProducts(String categoryId, List<Product> products);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final SharedPreferences _sharedPreferences;

  ProductsLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<Product>?> getCachedProducts(String categoryId) async {
    try {
      final jsonString =
          _sharedPreferences.getString('cached_products_$categoryId');
      if (jsonString != null) {
        final List<dynamic> jsonData = json.decode(jsonString);
        return jsonData
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      print('Error in getCachedProducts: $e');
    }
    return null;
  }

  @override
  Future<void> cacheProducts(String categoryId, List<Product> products) async {
    try {
      final jsonString = json.encode(products.map((e) => e.toJson()).toList());
      await _sharedPreferences.setString(
          'cached_products_$categoryId', jsonString);
    } catch (e) {
      print('Error in cacheProducts: $e');
    }
  }
}
