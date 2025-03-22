import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/cubits/cubit/user_info_cubit.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/widgets/user_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/injection_container.dart' as di;

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: BlocProvider(
        create: (context) => di.sl<UserInfoCubit>()..fetchUserInfo(),
        child: const UserViewBody(),
      ),
    );
  }
}
