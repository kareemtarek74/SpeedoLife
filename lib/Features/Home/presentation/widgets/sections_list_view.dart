import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/section_item.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';

class SectionsHorizontalListView extends StatelessWidget {
  const SectionsHorizontalListView({
    super.key,
    this.height,
    this.style,
    required this.sections,
    this.isProduct = false,
    this.isTrend = true,
  });

  final double? height;
  final TextStyle? style;
  final List sections;
  final bool? isProduct;
  final bool? isTrend;

  @override
  Widget build(BuildContext context) {
    List<Product> products =
        sections.map((json) => Product.fromJson(json)).toList();

    return SizedBox(
      height: height ?? 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SectionItem(
            isTrend: isTrend,
            isProduct: isProduct,
            style: style,
            price: products[index].finalPrice,
            name: sections[index]['name'],
            image: sections[index]['image'],
            categoryId: sections[index]['_id'],
            product: products[index],
            products: products,
          );
        },
      ),
    );
  }
}
