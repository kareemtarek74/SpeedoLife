import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Offers/Data/model/sub_categories_model.dart';
import 'package:speedo_life/Features/Offers/Domain/usecases/offer_categories_usecase.dart';
import 'package:speedo_life/injection_container.dart';

part 'offer_categories_state.dart';

class OfferCategoriesCubit extends Cubit<OfferCategoriesState> {
  final FetchOfferCategoriesUseCase _useCase =
      serviceLocator<FetchOfferCategoriesUseCase>();

  OfferCategoriesCubit() : super(OfferCategoriesInitial());

  Future<void> fetchCategories(String offerId) async {
    emit(OfferCategoriesLoading());
    final eitherResult = await _useCase(offerId);

    eitherResult.fold(
      (failure) => emit(OfferCategoriesError(failure.msg ?? "Unknown error")),
      (categories) => emit(OfferCategoriesLoaded(categories)),
    );
  }
}
