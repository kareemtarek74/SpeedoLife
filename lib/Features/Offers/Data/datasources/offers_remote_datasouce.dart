import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';
import 'package:speedo_life/core/Api/http_service.dart';

import '../../../../injection_container.dart';

abstract class OffersRemoteDataSource {
  Future<List<Offer>> fetchOffers();
}

class OffersRemoteDataSourceImpl implements OffersRemoteDataSource {
  final HttpService _httpHelper = serviceLocator<HttpService>();

  @override
  Future<List<Offer>> fetchOffers() async {
    final response = await _httpHelper.get(
      'http://209.250.237.58:5031/api/offer',
    );
    return (response.data as List).map((json) => Offer.fromJson(json)).toList();
  }
}
