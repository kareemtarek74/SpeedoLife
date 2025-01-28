import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/core/Api/http_service.dart';

import '../../../../injection_container.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product>> fetchProducts(String categoryId, int skip);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final HttpService _httpHelper = serviceLocator<HttpService>();

  @override
  @override
  Future<List<Product>> fetchProducts(String categoryId, int skip) async {
    final response = await _httpHelper.get(
      'http://209.250.237.58:5031/api/product?skip=$skip&category=$categoryId',
    );
    return (response.data as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
