import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/section_products_sections_list_view.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class SectionProductsPageViewBody extends StatelessWidget {
  const SectionProductsPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'العناية بالبشرة',
              ),
              Row(
                children: [
                  const Expanded(child: SectionProductsSectionsListView()),
                  SvgPicture.asset(Assets.imagesArrowDown)
                ],
              )
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ProductsGridView(),
          ),
        )
      ],
    );
  }
}
