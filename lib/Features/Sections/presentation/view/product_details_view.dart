import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/custom_buttom_nav_bar.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static const routeName = 'product_details_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ProductDetailsViewBody()),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
