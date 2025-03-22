import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:speedo_life/Features/Auth/domain/Entities/auth_entity.dart';
import 'package:speedo_life/Features/Auth/domain/UseCases/auth_usecase.dart';
import 'package:speedo_life/injection_container.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final FetchAuthUseCase _useCase = serviceLocator<FetchAuthUseCase>();

  SignInCubit() : super(SignInInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    final result = await _useCase.signIn(email, password);
    result.fold((failure) {
      emit(SignInFailure(message: failure.msg ?? "Unknown error"));
    }, (userEntity) {
      emit(SignInSuccess(userEntity: userEntity));
    });
  }
}
