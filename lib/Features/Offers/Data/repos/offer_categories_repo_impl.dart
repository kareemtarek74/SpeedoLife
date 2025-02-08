import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offer_categories_local_data_source.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offer_categories_remote_datasource.dart';
import 'package:speedo_life/Features/Offers/Data/model/sub_categories_model.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offer_categories_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/injection_container.dart';

class OfferCategoriesRepositoryImpl implements OfferCategoriesRepo {
  final OfferCategoriesRemoteDataSource _remoteDataSource =
      serviceLocator<OfferCategoriesRemoteDataSource>();
  final OfferCategoriesLocalDataSource _localDataSource =
      serviceLocator<OfferCategoriesLocalDataSource>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, List<SubCategoriesModel>>> getOfferCategories(
      String offerId) async {
    try {
      final cachedData = await _localDataSource.getCachedCategories(offerId);
      if (cachedData != null && cachedData.isNotEmpty) {
        return Right(cachedData);
      }

      final remoteData = await _remoteDataSource.fetchOfferCategories(offerId);
      await _localDataSource.cacheCategories(offerId, remoteData);

      return Right(remoteData);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }
}
