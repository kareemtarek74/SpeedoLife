import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/Features/Sections/presentation/view/product_details_view.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_cart_button.dart';

class ProductsGridViewItem extends StatelessWidget {
  const ProductsGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsView.routeName);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(width: 1, color: Color(0xFFEFEEEE))),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Column(
                  children: [
                    Flexible(child: Image.asset(Assets.imagesProduct)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'سيرافي لوشن ترطيب للبشرة الجافة مع حمض الهيالورو ...',
                      style: Styles.styleSemiBold12(context)
                          .copyWith(color: const Color(0xff404040)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          '4,000 د',
                          style: Styles.styleBold16(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomCartButton(
                      padding: EdgeInsets.symmetric(vertical: 11),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                  )),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: SvgPicture.asset(Assets.imagesTag),
            ),
          ],
        ),
      ),
    );
  }
}
