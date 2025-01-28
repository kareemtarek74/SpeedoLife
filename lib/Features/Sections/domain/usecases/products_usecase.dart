import 'package:dartz/dartz.dart';

import '../../../../core/Api/failure.dart';
import '../../../../injection_container.dart';
import '../../data/model/products_model.dart';
import '../Repos/products_repo.dart';

class FetchProductsUseCase {
  final ProductsRepository _repo = serviceLocator<ProductsRepository>();

  Future<Either<Failure, List<Product>>> call(
      String categoryId, int skip) async {
    return await _repo.getProducts(categoryId, skip);
  }
}
