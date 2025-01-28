import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Sections/data/model/categories_model.dart';
import 'package:speedo_life/Features/Sections/domain/usecases/categories_usecase.dart';
import 'package:speedo_life/injection_container.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final _useCase = serviceLocator<FetchCategoriesUseCase>();

  CategoriesCubit() : super(CategoriesInitial());

  Future<void> loadCategories() async {
    emit(CategoriesLoading());
    final eitherResult = await _useCase();

    eitherResult.fold(
      (failure) => emit(CategoriesError(failure.msg ?? "Unknown error")),
      (categories) => emit(CategoriesLoaded(categories: categories)),
    );
  }
}
