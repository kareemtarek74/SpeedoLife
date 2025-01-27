import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Home/Domain/Repos/home_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/injection_container.dart';

import '../DataSource/home_local_data_source.dart';
import '../DataSource/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _remoteDataSource = serviceLocator<HomeDataSource>();
  final HomeLocalDataSource _localDataSource =
      serviceLocator<HomeLocalDataSource>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, Map<String, dynamic>>> getHomeData() async {
    try {
      final cachedData = await _localDataSource.getCachedHomeData();
      if (cachedData != null) {
        return Right(cachedData);
      }

      final remoteData = await _remoteDataSource.fetchHomeData();

      await _localDataSource.cacheHomeData(remoteData);

      return Right(remoteData);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }
}
