import 'package:dartz/dartz.dart';
import 'package:speedo_life/Features/Home/Domain/Repos/home_repo.dart';
import 'package:speedo_life/core/Api/failure.dart';
import 'package:speedo_life/injection_container.dart';

class FetchHomeDataUseCase {
  final HomeRepository _repo = serviceLocator<HomeRepository>();

  Future<Either<Failure, Map<String, dynamic>>> call() async {
    return await _repo.getHomeData();
  }
}
