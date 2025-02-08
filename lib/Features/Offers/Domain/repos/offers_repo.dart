import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';
import 'package:speedo_life/core/Api/failure.dart';

abstract class OffersRepo {
  Future<Either<Failure, List<Offer>>> getOffers();
}
