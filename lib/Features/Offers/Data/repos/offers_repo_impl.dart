import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offers_local_datasource.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offers_remote_datasouce.dart';
import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offers_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/injection_container.dart';

class OffersRepositoryImpl implements OffersRepo {
  final OffersRemoteDataSource _remoteDataSource =
      serviceLocator<OffersRemoteDataSource>();
  final OffersLocalDataSource _localDataSource =
      serviceLocator<OffersLocalDataSource>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, List<Offer>>> getOffers() async {
    try {
      final cachedData = await _localDataSource.getCachedOffers();
      if (cachedData != null && cachedData.isNotEmpty) {
        return Right(cachedData);
      }

      final remoteData = await _remoteDataSource.fetchOffers();

      await _localDataSource.cacheOffers(remoteData);

      return Right(remoteData);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }
}
