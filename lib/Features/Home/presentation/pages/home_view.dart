import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Home/presentation/cubits/Home%20Cubit/home_cubit.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/home_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/injection_container.dart' as di;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: BlocProvider<HomeCubit>(
        create: (context) => di.sl<HomeCubit>()..loadHomeData(),
        child: const HomeViewBody(),
      ),
    );
  }
}
