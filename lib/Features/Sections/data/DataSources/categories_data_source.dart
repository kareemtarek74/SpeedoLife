import 'package:speedo_life/core/Api/http_service.dart';

import '../../../../injection_container.dart';
import '../model/categories_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<Category>> fetchCategories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final HttpService _httpHelper = serviceLocator<HttpService>();

  @override
  Future<List<Category>> fetchCategories() async {
    final response = await _httpHelper.get(
      'http://209.250.237.58:5031/api/category',
    );
    return (response.data as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }
}
