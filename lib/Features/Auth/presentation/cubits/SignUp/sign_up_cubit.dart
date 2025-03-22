import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:speedo_life/Features/Auth/domain/Entities/auth_entity.dart';
import 'package:speedo_life/Features/Auth/domain/UseCases/auth_usecase.dart';
import 'package:speedo_life/injection_container.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final FetchAuthUseCase _useCase = serviceLocator<FetchAuthUseCase>();

  SignUpCubit() : super(SignUpInitial());

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    emit(SignUpLoading());
    final result = await _useCase.call(email, password);
    result.fold((failure) {
      emit(SignUpFailure(message: failure.msg ?? "Unknown error"));
    }, (userEntity) {
      emit(SignUpSuccess(userEntity: userEntity));
    });
  }
}
