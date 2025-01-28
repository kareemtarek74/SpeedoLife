import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Sections/data/model/categories_model.dart';
import 'package:speedo_life/Features/Sections/domain/Repos/categories_repo.dart';

import '../../../../core/Api/failure.dart';
import '../../../../injection_container.dart';

class FetchCategoriesUseCase {
  final CategoriesRepository _repo = serviceLocator<CategoriesRepository>();

  Future<Either<Failure, List<Category>>> call() async {
    return await _repo.getCategories();
  }
}
