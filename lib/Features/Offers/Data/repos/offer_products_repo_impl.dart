import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Offers/Data/datasources/offer_products_remote_datasource.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offer_products_repo.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/injection_container.dart';

class OfferProductsRepoImpl implements OfferProductsRepo {
  final OfferProductsRemoteDatasource _remoteDataSource =
      serviceLocator<OfferProductsRemoteDatasource>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, List<Product>>> getOfferProducts(
      String offerId, String categoryId) async {
    try {
      final remoteData =
          await _remoteDataSource.fetchOfferProducts(offerId, categoryId);
      return Right(remoteData);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }
}
