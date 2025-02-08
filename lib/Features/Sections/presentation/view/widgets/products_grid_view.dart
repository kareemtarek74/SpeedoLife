import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view_item.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;
  final bool? isTrend;
  const ProductsGridView({
    super.key,
    required this.products,
    this.isTrend = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 167 / 303,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductsGridViewItem(
            isTrend: isTrend,
            product: product,
            name: product.name,
            price: product.finalPrice,
            imageUrl: product.image.toString(),
            status: product.status,
            products: products,
          );
        },
      ),
    );
  }
}
