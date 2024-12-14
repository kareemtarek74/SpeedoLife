import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/section_products_page_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

class SectionProductsPageView extends StatelessWidget {
  const SectionProductsPageView({super.key});
  static const String routeName = 'section_products_page';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(child: SectionProductsPageViewBody()));
  }
}
