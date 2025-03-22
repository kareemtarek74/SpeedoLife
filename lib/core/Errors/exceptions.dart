import 'package:speedo_life/core/Api/failure.dart';

class CustomException extends Failure {
  CustomException({super.msg, super.data});

  @override
  String toString() {
    return msg.toString();
  }
}
