import 'package:dartz/dartz.dart';
import 'package:speedo_life/core/Api/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, Map<String, dynamic>>> getHomeData();
}