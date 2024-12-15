import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 167 / 303,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return const ProductsGridViewItem();
          }),
    );
  }
}
