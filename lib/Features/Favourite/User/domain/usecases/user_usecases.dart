import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Favourite/User/data/model/user_model.dart';
import 'package:speedo_life/Features/Favourite/User/domain/Repos/user_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/injection_container.dart';

class FetchUserInfoUseCase {
  final UserRepo _repo = serviceLocator<UserRepo>();

  Future<Either<Failure, UserInfo>> call() async {
    return await _repo.getUserInfo();
  }
}
