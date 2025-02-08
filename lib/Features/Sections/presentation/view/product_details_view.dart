import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/custom_buttom_nav_bar.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView(
      {super.key,
      required this.product,
      required this.products,
      required this.isTrend});
  final Product product;
  final List<Product> products;
  static const routeName = 'product_details_view';
  final bool isTrend;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ProductDetailsViewBody(
        product: product,
        products: products,
        isTrend: isTrend,
      )),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
