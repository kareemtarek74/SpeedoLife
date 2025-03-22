import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Auth/domain/Entities/auth_entity.dart';
import 'package:speedo_life/core/Api/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
}
