import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/home_category_body.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/home_product_body.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/presentation/view/product_details_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/section_products_page_view.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
    required this.style,
    required this.name,
    required this.image,
    required this.categoryId,
    this.isProduct = false,
    this.price,
    this.products,
    this.product,
    this.isTrend = true,
  });

  final TextStyle? style;
  final String name;
  final String image;
  final String categoryId;
  final int? price;
  final bool? isProduct;
  final List<Product>? products;
  final Product? product;
  final bool? isTrend;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isProduct == false
            ? Navigator.pushNamed(
                context,
                SectionProductsPageView.routeName,
                arguments: {
                  'categoryId': categoryId,
                  'categoryName': name,
                },
              )
            : Navigator.pushNamed(
                context,
                ProductDetailsView.routeName,
                arguments: {
                  'product': product,
                  'products': products,
                  'isTrend': isTrend,
                },
              );
      },
      child: Container(
        width: isProduct == true ? 136 : null,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isProduct == false
            ? HomeCategoryBody(image: image, name: name, style: style)
            : HomeProductBody(
                image: image,
                name: name,
                price: price,
                isTrend: isTrend,
              ),
      ),
    );
  }
}
