import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/best_selling_products_view_body.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

class BestSellingProductsView extends StatelessWidget {
  const BestSellingProductsView(
      {super.key, required this.products, this.isTrend = true});
  static const String routeName = 'best_selling_products_view';
  final List<Product> products;
  final bool? isTrend;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
            child: BestSellingProductsViewBody(
          isTrend: isTrend,
          products: products,
        )));
  }
}
