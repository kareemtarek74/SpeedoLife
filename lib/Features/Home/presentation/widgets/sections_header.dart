import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/best_selling_products_view.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/presentation/view/sections_view.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

import '../../../../core/utils/text_styles.dart';

class SectionsHeader extends StatelessWidget {
  const SectionsHeader(
      {super.key,
      required this.text,
      this.isCategories = true,
      required this.products,
      required this.isTrend});
  final String text;
  final bool? isCategories;
  final List<Product> products;
  final bool isTrend;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isCategories == true
            ? Navigator.pushNamed(context, SectionsView.routeName)
            : Navigator.pushNamed(
                context,
                BestSellingProductsView.routeName,
                arguments: {
                  'products': products,
                  'isTrend': isTrend,
                },
              );
      },
      child: Row(
        children: [
          Text(
            text,
            textAlign: TextAlign.right,
            style: Styles.styleBold16(context),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                'المزيد',
                textAlign: TextAlign.center,
                style: Styles.styleSemiBold14(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4, top: 4),
                child: Icon(
                  size: 16,
                  FontAwesomeIcons.chevronLeft,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
