import 'package:dartz/dartz.dart';
import 'package:speedo_life/core/Api/failure.dart';

import '../../../Sections/data/model/products_model.dart';

abstract class OfferProductsRepo {
  Future<Either<Failure, List<Product>>> getOfferProducts(
      String offerId, String categoryId);
}
