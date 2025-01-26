import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Home/Domain/useCases/home_usecase.dart';
import 'package:speedo_life/injection_container.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final _homeUseCase = serviceLocator<FetchHomeDataUseCase>();

  HomeCubit() : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    final eitherResult = await _homeUseCase();

    eitherResult.fold(
      (failure) => emit(HomeError(message: failure.msg ?? "Unknown error")),
      (data) => emit(HomeLoaded(data: data)),
    );
  }
}
