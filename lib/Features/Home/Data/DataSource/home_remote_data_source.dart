import 'package:speedo_life/core/Api/http_service.dart';
import '../../../../injection_container.dart';

abstract class HomeDataSource {
  Future<Map<String, dynamic>> fetchHomeData();
}

class HomeDataSourceImpl implements HomeDataSource {
  final HttpService _httpHelper = serviceLocator<HttpService>();

  @override
  Future<Map<String, dynamic>> fetchHomeData() async {
    final response = await _httpHelper.get(
      'http://209.250.237.58:5031/api/home',
    );
    return response.data; 
  }
}
