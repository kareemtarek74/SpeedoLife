import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:speedo_life/Features/Favourite/User/data/model/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserInfo?> getCachedUserInfo();
  Future<void> cacheUserInfo(UserInfo userInfo);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const _cacheKey = "cached_user_info";
  final SharedPreferences _sharedPreferences;

  UserLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<UserInfo?> getCachedUserInfo() async {
    final jsonString = _sharedPreferences.getString(_cacheKey);
    if (jsonString != null) {
      return UserInfo.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> cacheUserInfo(UserInfo userInfo) async {
    final jsonString = json.encode(userInfo.toJson());
    await _sharedPreferences.setString(_cacheKey, jsonString);
  }
}
