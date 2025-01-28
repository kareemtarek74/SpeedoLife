import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Sections/presentation/cubits/Categories%20cubit/categories_cubit.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/sections_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/injection_container.dart' as di;

class SectionsView extends StatelessWidget {
  const SectionsView({super.key});
  static const String routeName = 'sectionView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
            child: BlocProvider<CategoriesCubit>(
          create: (context) => di.sl<CategoriesCubit>()..loadCategories(),
          child: const SectionsViewBody(),
        )));
  }
}
