import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/filter_list_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/colored_filter_list.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/product_image.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/product_text_span.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'تفاصيل المنتج',
              ),
              const ProductImage(),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '10,000 د',
                    style: Styles.styleBold24(context).copyWith(
                        color: const Color(0xffAAAAAA),
                        decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '8,000 د',
                    style: Styles.styleBold24(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      'سيرافي لوشن ترطيب للبشرة الجافة مع حمض الهيالورونيك و السيراميد',
                      style: Styles.styleBold20(context),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ProductTextSpan(),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                color: AppColors.secondaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'اضافات',
                      style: Styles.styleBold12(context)
                          .copyWith(color: const Color(0xffAAAAAA)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'اللون',
                      style: Styles.styleSemiBold14(context)
                          .copyWith(color: const Color(0xff404040)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ColoredFilterList(),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'الحجم',
                      style: Styles.styleSemiBold14(context)
                          .copyWith(color: const Color(0xff404040)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const FilterListView(
                      filters: ["صغير (٧٨٧د)", 'متوسط (٩٨٧د)', "كبير (٩٨٠د)"],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'منشفة (٧٦٨د)',
                          style: Styles.styleSemiBold14(context)
                              .copyWith(color: const Color(0xff404040)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'منتجات مشابهة',
                          style: Styles.styleBold16(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SliverFillRemaining(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ProductsGridView(),
        ))
      ],
    );
  }
}
