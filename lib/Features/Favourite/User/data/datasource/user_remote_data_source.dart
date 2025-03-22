import 'package:speedo_life/Features/Favourite/User/data/model/user_model.dart';
import 'package:speedo_life/core/Api/http_service.dart';
import 'package:speedo_life/injection_container.dart';

abstract class UserRemoteDataSource {
  Future<UserInfo> fetchUserInfo();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final HttpService _httpHelper = serviceLocator<HttpService>();

  @override
  Future<UserInfo> fetchUserInfo() async {
    final response =
        await _httpHelper.get('http://209.250.237.58:5031/api/info');
    return UserInfo.fromJson(response.data);
  }
}
