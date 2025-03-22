import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/Features/Sections/presentation/view/product_details_view.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';
import 'package:speedo_life/core/widgets/custom_cart_button.dart';
import 'package:speedo_life/core/widgets/favourite_icon.dart';

class ProductsGridViewItem extends StatelessWidget {
  final String name;
  final Color? color;
  final int price;
  final String imageUrl;
  final int status;
  final Product product;
  final List<Product> products;
  final bool? isTrend;
  final bool? isOffer;

  const ProductsGridViewItem({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.status,
    required this.product,
    required this.products,
    this.color = Colors.white,
    this.isTrend = false,
    this.isOffer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
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
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(width: 1, color: Color(0xFFEFEEEE)),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 170,
                        child: ImageWithCache(
                          fit: BoxFit.scaleDown,
                          imageUrl: imageUrl,
                        )),
                    const SizedBox(height: 8),
                    Text(
                      name,
                      style: Styles.styleSemiBold12(context)
                          .copyWith(color: const Color(0xff404040)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Row(
                        children: [
                          Text(
                            '$price دينار',
                            style: Styles.styleBold16(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const CustomCartButton(
                      padding: EdgeInsets.symmetric(vertical: 11),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 0,
              right: 0,
              child: FavouriteIcon(),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: isTrend == false
                  ? Row(
                      children: [
                        SvgPicture.asset(Assets.imagesTag),
                        const SizedBox(
                          width: 4,
                        ),
                        isOffer == true
                            ? SvgPicture.asset(Assets.imagesOfferTag)
                            : const SizedBox(),
                      ],
                    )
                  : Row(
                      children: [
                        SvgPicture.asset(Assets.imagesTrendtag),
                        const SizedBox(
                          width: 4,
                        ),
                        isOffer == true
                            ? SvgPicture.asset(Assets.imagesOfferTag)
                            : const SizedBox(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
