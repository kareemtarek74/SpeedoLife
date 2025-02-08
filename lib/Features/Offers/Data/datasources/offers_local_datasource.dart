import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';

abstract class OffersLocalDataSource {
  Future<List<Offer>?> getCachedOffers();
  Future<void> cacheOffers(List<Offer> offers);
}

class OffersLocalDataSourceImpl implements OffersLocalDataSource {
  static const _cacheKey = "cached_offers";
  final SharedPreferences _sharedPreferences;

  OffersLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<Offer>?> getCachedOffers() async {
    final jsonString = _sharedPreferences.getString(_cacheKey);
    if (jsonString != null) {
      final List decodedJson = json.decode(jsonString);
      return decodedJson.map((json) => Offer.fromJson(json)).toList();
    }
    return null;
  }

  @override
  Future<void> cacheOffers(List<Offer> offers) async {
    final jsonString = json.encode(offers.map((e) => e.toJson()).toList());
    await _sharedPreferences.setString(_cacheKey, jsonString);
  }
}
