import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Offers/Domain/usecases/offers_usecase.dart';
import 'package:speedo_life/injection_container.dart';

import '../../../Data/model/offers_model.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  final _useCase = serviceLocator<FetchOffersUseCase>();

  OffersCubit() : super(OffersInitial());

  Future<void> loadOffers() async {
    emit(OffersLoading());
    final eitherResult = await _useCase();

    eitherResult.fold(
      (failure) => emit(OffersError(failure.msg ?? "Unknown error")),
      (offers) => emit(OffersLoaded(offers: offers)),
    );
  }
}
