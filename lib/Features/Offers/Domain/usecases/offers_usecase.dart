import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';
import 'package:speedo_life/Features/Offers/Domain/repos/offers_repo.dart';

import '../../../../core/Api/failure.dart';
import '../../../../injection_container.dart';

class FetchOffersUseCase {
  final OffersRepo _repo = serviceLocator<OffersRepo>();

  Future<Either<Failure, List<Offer>>> call() async {
    return await _repo.getOffers();
  }
}
