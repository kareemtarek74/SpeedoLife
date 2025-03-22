import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Favourite/User/data/model/user_model.dart';
import 'package:speedo_life/Features/Favourite/User/domain/usecases/user_usecases.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/injection_container.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final FetchUserInfoUseCase _useCase = serviceLocator<FetchUserInfoUseCase>();

  UserInfoCubit() : super(UserInfoInitial());

  Future<void> fetchUserInfo() async {
    emit(UserInfoLoading());
    final Either<Failure, UserInfo> eitherResult = await _useCase();

    eitherResult.fold(
      (failure) => emit(UserInfoError(failure.msg ?? "Unknown error")),
      (userInfo) => emit(UserInfoLoaded(userInfo: userInfo)),
    );
  }
}
