import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Offers/Data/model/sub_categories_model.dart';

abstract class OfferCategoriesLocalDataSource {
  Future<List<SubCategoriesModel>?> getCachedCategories(String offerId);
  Future<void> cacheCategories(
      String offerId, List<SubCategoriesModel> categories);
}

class OfferCategoriesLocalDataSourceImpl
    implements OfferCategoriesLocalDataSource {
  final SharedPreferences _sharedPreferences;

  OfferCategoriesLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<SubCategoriesModel>?> getCachedCategories(String offerId) async {
    final cacheKey = _generateCacheKey(offerId);
    final jsonString = _sharedPreferences.getString(cacheKey);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString);
      return decodedJson
          .map((json) => SubCategoriesModel.fromJson(json))
          .toList();
    }
    return null;
  }

  @override
  Future<void> cacheCategories(
      String offerId, List<SubCategoriesModel> categories) async {
    final cacheKey = _generateCacheKey(offerId);
    final jsonString =
        json.encode(categories.map((category) => category.toJson()).toList());
    await _sharedPreferences.setString(cacheKey, jsonString);
  }

  String _generateCacheKey(String offerId) {
    return "cached_offer_categories_$offerId";
  }
}
