import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/categories_data_source.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/categories_local_data_source.dart';
import 'package:speedo_life/Features/Sections/data/model/categories_model.dart';
import 'package:speedo_life/Features/Sections/domain/Repos/categories_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/injection_container.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _remoteDataSource =
      serviceLocator<CategoriesRemoteDataSource>();
  final CategoriesLocalDataSource _localDataSource =
      serviceLocator<CategoriesLocalDataSource>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final cachedData = await _localDataSource.getCachedCategories();
      if (cachedData != null && cachedData.isNotEmpty) {
        return Right(cachedData);
      }

      final remoteData = await _remoteDataSource.fetchCategories();
      await _localDataSource.cacheCategories(remoteData);
      return Right(remoteData);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }
}
