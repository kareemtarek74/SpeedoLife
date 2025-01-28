import 'package:dartz/dartz.dart';
import 'package:speedo_life/core/Api/failure.dart';

import '../../data/model/products_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts(
      String categoryId, int skip);
}
