import 'package:speedo_life/Features/Offers/Data/model/sub_categories_model.dart';
import 'package:speedo_life/core/Api/http_service.dart';

import '../../../../injection_container.dart';

abstract class OfferCategoriesRemoteDataSource {
  Future<List<SubCategoriesModel>> fetchOfferCategories(String offerId);
}

class OfferCategoriesRemoteDataSourceImpl
    implements OfferCategoriesRemoteDataSource {
  final HttpService _httpHelper = serviceLocator<HttpService>();

  @override
  Future<List<SubCategoriesModel>> fetchOfferCategories(String offerId) async {
    final response = await _httpHelper.get(
      'http://209.250.237.58:5031/api/offer/category/$offerId',
    );
    return (response.data as List)
        .map((json) => SubCategoriesModel.fromJson(json))
        .toList();
  }
}
