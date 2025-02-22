import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offer_products_repo.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';

import '../../../../core/Api/failure.dart';
import '../../../../injection_container.dart';

class FetchOfferProductsUseCase {
  final OfferProductsRepo _repo = serviceLocator<OfferProductsRepo>();

  Future<Either<Failure, List<Product>>> call(
      String offerId, String categoryId) async {
    return await _repo.getOfferProducts(offerId, categoryId);
  }
}
