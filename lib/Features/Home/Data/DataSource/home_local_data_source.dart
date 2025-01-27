import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataSource {
  Future<Map<String, dynamic>?> getCachedHomeData();
  Future<void> cacheHomeData(Map<String, dynamic> data);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const _cacheKey = "cached_home_data";

  final SharedPreferences _sharedPreferences;

  HomeLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<Map<String, dynamic>?> getCachedHomeData() async {
    final jsonString = _sharedPreferences.getString(_cacheKey);
    if (jsonString != null) {
      return json.decode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  @override
  Future<void> cacheHomeData(Map<String, dynamic> data) async {
    final jsonString = json.encode(data);
    await _sharedPreferences.setString(_cacheKey, jsonString);
  }
}
