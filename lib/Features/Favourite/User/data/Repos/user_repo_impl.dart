import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Favourite/User/data/datasource/user_local_data_source.dart';
import 'package:speedo_life/Features/Favourite/User/data/datasource/user_remote_data_source.dart';
import 'package:speedo_life/Features/Favourite/User/data/model/user_model.dart';
import 'package:speedo_life/Features/Favourite/User/domain/Repos/user_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/injection_container.dart';

class UserRepositoryImpl implements UserRepo {
  final UserRemoteDataSource _remoteDataSource =
      serviceLocator<UserRemoteDataSource>();
  final UserLocalDataSource _localDataSource =
      serviceLocator<UserLocalDataSource>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, UserInfo>> getUserInfo() async {
    try {
      final cachedData = await _localDataSource.getCachedUserInfo();
      if (cachedData != null) {
        return Right(cachedData);
      }

      final remoteData = await _remoteDataSource.fetchUserInfo();
      await _localDataSource.cacheUserInfo(remoteData);
      return Right(remoteData);
    } on DioException catch (e) {
      return Left(_failureHandler.getFailureType(e));
    }
  }
}
