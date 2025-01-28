import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Sections/data/model/categories_model.dart';
import 'package:speedo_life/core/Api/failure.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
