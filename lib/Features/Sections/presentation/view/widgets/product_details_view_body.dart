import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/product_image.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/product_text_span.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody(
      {super.key,
      required this.product,
      required this.products,
      required this.isTrend});
  final Product product;
  final List<Product> products;
  final bool isTrend;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: 'تفاصيل المنتج',
              ),
              ProductImage(
                image: product.image.toString(),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    product.finalPrice < 25000
                        ? (product.finalPrice + 500).toString()
                        : product.finalPrice < 80000
                            ? (product.finalPrice + 1000).toString()
                            : (product.finalPrice + 5000).toString(),
                    style: Styles.styleBold24(context).copyWith(
                        color: const Color(0xffAAAAAA),
                        decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    product.finalPrice.toString(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Styles.styleBold20(context),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ProductTextSpan(
                      text: product.description,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              /*   Container(
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
                      horizontalPadding: 18,
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
              ), */
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
        SliverToBoxAdapter(
          child: Container(
              color: AppColors.secondaryColor,
              child: ProductsGridView(
                products: products,
                isTrend: isTrend,
              )),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        )
      ],
    );
  }
}
