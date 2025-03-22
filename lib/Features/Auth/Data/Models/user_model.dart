import 'package:firebase_auth/firebase_auth.dart';
import 'package:speedo_life/Features/Auth/domain/Entities/auth_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.userId});

  factory UserModel.fromFireBaseService(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      userId: user.uid,
    );
  }
}
