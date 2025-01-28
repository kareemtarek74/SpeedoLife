import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/products_data_source.dart';
import 'package:speedo_life/Features/Sections/data/DataSources/products_local_data_source.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/domain/Repos/products_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/injection_container.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _remoteDataSource =
      serviceLocator<ProductsRemoteDataSource>();
  final ProductsLocalDataSource _localDataSource =
      serviceLocator<ProductsLocalDataSource>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, List<Product>>> getProducts(
      String categoryId, int skip) async {
    try {
      final cachedData = await _localDataSource.getCachedProducts(categoryId);
      if (cachedData != null && cachedData.isNotEmpty && skip == 0) {
        return Right(cachedData);
      }

      final remoteData =
          await _remoteDataSource.fetchProducts(categoryId, skip);
      if (skip == 0) {
        await _localDataSource.cacheProducts(categoryId, remoteData);
      }
      return Right(remoteData);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }
}
