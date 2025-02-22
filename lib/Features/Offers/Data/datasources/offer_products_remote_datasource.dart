import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/core/Api/http_service.dart';

import '../../../../injection_container.dart';

abstract class OfferProductsRemoteDatasource {
  Future<List<Product>> fetchOfferProducts(String offerId, String categoryId);
}

class OfferProductsRemoteDataSourceImpl
    implements OfferProductsRemoteDatasource {
  final HttpService _httpHelper = serviceLocator<HttpService>();

  @override
  Future<List<Product>> fetchOfferProducts(
      String offerId, String categoryId) async {
    final response = await _httpHelper.get(
      'http://209.250.237.58:5031/api/product?offer=$offerId&category=$categoryId',
    );
    return (response.data as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
