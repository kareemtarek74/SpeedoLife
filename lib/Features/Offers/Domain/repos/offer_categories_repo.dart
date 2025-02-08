import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Offers/Data/model/sub_categories_model.dart';
import 'package:speedo_life/core/Api/failure.dart';

abstract class OfferCategoriesRepo {
  Future<Either<Failure, List<SubCategoriesModel>>> getOfferCategories(
      String offerId);
}
