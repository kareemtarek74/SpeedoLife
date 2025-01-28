import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Sections/data/model/categories_model.dart';

abstract class CategoriesLocalDataSource {
  Future<List<Category>?> getCachedCategories();
  Future<void> cacheCategories(List<Category> categories);
}

class CategoriesLocalDataSourceImpl implements CategoriesLocalDataSource {
  static const _cacheKey = "cached_categories";
  final SharedPreferences _sharedPreferences;

  CategoriesLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<Category>?> getCachedCategories() async {
    final jsonString = _sharedPreferences.getString(_cacheKey);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString);
      return decodedJson.map((json) => Category.fromJson(json)).toList();
    }
    return null;
  }

  @override
  Future<void> cacheCategories(List<Category> categories) async {
    final jsonString = json.encode(categories.map((e) => e.toJson()).toList());
    await _sharedPreferences.setString(_cacheKey, jsonString);
  }
}
