import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speedo_life/Features/Auth/Data/Models/user_model.dart';
import 'package:speedo_life/Features/Auth/domain/Entities/auth_entity.dart';
import 'package:speedo_life/Features/Auth/domain/Repos/auth_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/core/Api/failure_handler.dart';
import 'package:speedo_life/core/Errors/Exceptions.dart';
import 'package:speedo_life/core/services/firebase_auth_services.dart';
import 'package:speedo_life/injection_container.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices _firebaseAuthServices =
      serviceLocator<FirebaseAuthServices>();
  final _failureHandler = serviceLocator<FailureHandler>();

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await _firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFireBaseService(user));
    } on CustomException catch (e) {
      return Left(e);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await _firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFireBaseService(user));
    } on CustomException catch (e) {
      return Left(e);
    } on DioException catch (e) {
      final failure = _failureHandler.getFailureType(e);
      return Left(failure);
    }
  }
}
