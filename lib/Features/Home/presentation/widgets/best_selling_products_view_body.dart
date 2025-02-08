import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class BestSellingProductsViewBody extends StatelessWidget {
  const BestSellingProductsViewBody({
    super.key,
    required this.products,
    this.isTrend = true,
  });
  final List<Product> products;
  final bool? isTrend;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(
                  title: isTrend == true ? 'الأكثر طلبا' : 'وصل حديثا'),
            ],
          ),
        ),
        SliverFillRemaining(
          child: ProductsGridView(
            products: products,
            isTrend: isTrend,
          ),
        ),
      ],
    );
  }
}
