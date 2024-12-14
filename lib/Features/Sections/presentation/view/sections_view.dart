import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/sections_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({super.key});
  static const String routeName = 'sectionView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(child: SectionsViewBody()));
  }
}
