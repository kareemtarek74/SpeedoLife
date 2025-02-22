import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Offers/Domain/usecases/offer_products_usecase.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/injection_container.dart';

part 'offer_products_state.dart';

class OfferProductsCubit extends Cubit<OfferProductsState> {
  final FetchOfferProductsUseCase _useCase =
      serviceLocator<FetchOfferProductsUseCase>();

  OfferProductsCubit() : super(OfferProductsInitial());

  Future<void> fetchProducts(String offerId, String categoryId) async {
    emit(OfferProductsLoading());
    final result = await _useCase(offerId, categoryId);

    result.fold(
      (failure) => emit(OfferProductsError(failure.msg ?? "Unknown error")),
      (products) => emit(OfferProductsLoaded(products)),
    );
  }
}
