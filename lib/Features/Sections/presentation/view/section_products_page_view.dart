import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Sections/presentation/cubits/Products%20Cubit/products_cubit.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/section_products_page_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

class SectionProductsPageView extends StatelessWidget {
  const SectionProductsPageView(
      {super.key, required this.categoryId, required this.categoryName});
  final String categoryId, categoryName;
  static const String routeName = 'section_products_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
            child: BlocProvider(
          create: (context) => ProductsCubit()..loadProducts(categoryId, 0),
          child: SectionProductsPageViewBody(
            categoryId: categoryId,
            categoryName: categoryName,
          ),
        )));
  }
}
