import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Favourite/presentation/widgets/favourite_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: FavouriteViewBody(),
    );
  }
}
