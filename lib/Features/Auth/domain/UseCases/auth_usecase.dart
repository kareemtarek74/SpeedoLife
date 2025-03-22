import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Auth/domain/Entities/auth_entity.dart';
import 'package:speedo_life/Features/Auth/domain/Repos/auth_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/injection_container.dart';

class FetchAuthUseCase {
  final AuthRepo _repo = serviceLocator<AuthRepo>();

  Future<Either<Failure, UserEntity>> call(
      String email, String password) async {
    return await _repo.createUserWithEmailAndPassword(email, password);
  }

  Future<Either<Failure, UserEntity>> signIn(
      String email, String password) async {
    return await _repo.signInWithEmailAndPassword(email, password);
  }
}
