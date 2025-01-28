import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Sections/domain/usecases/products_usecase.dart';
import 'package:speedo_life/injection_container.dart';

import '../../../data/model/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FetchProductsUseCase _useCase = serviceLocator<FetchProductsUseCase>();

  ProductsCubit() : super(ProductsInitial());

  Future<void> loadProducts(String categoryId, int skip) async {
    if (skip == 0) emit(ProductsLoading());
    final eitherResult = await _useCase(categoryId, skip);

    eitherResult.fold(
      (failure) => emit(ProductsError(failure.msg ?? "Unknown error")),
      (products) => emit(ProductsLoaded(products: products)),
    );
  }
}
