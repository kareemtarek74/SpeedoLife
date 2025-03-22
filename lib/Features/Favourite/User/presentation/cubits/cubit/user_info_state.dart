part of 'user_info_cubit.dart';

abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final UserInfo userInfo;
  UserInfoLoaded({required this.userInfo});
}

class UserInfoError extends UserInfoState {
  final String message;
  UserInfoError(this.message);
}
