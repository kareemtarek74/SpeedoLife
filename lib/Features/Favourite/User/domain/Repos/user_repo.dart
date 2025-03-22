import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Favourite/User/data/model/user_model.dart';
import 'package:speedo_life/core/Api/failure.dart';

abstract class UserRepo {
  Future<Either<Failure, UserInfo>> getUserInfo();
}
