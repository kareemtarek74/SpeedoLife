import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Offers/Data/model/sub_categories_model.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offer_categories_repo.dart';

import '../../../../core/Api/failure.dart';
import '../../../../injection_container.dart';

class FetchOfferCategoriesUseCase {
  final OfferCategoriesRepo _repo = serviceLocator<OfferCategoriesRepo>();

  Future<Either<Failure, List<SubCategoriesModel>>> call(String offerId) async {
    return await _repo.getOfferCategories(offerId);
  }
}
