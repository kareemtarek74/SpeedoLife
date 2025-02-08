import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';
import 'package:speedo_life/core/widgets/custom_cart_button.dart';

class HomeProductBody extends StatelessWidget {
  const HomeProductBody({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.isTrend = true,
  });

  final String image;
  final String name;
  final int? price;
  final bool? isTrend;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 170,
                    child: ImageWithCache(
                      fit: BoxFit.scaleDown,
                      imageUrl: image,
                    )),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: Styles.styleSemiBold12(context)
                      .copyWith(color: const Color(0xff404040)),
                  maxLines: 1,
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
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ),
        Positioned(
          top: 12,
          left: 16,
          child: isTrend == true
              ? SvgPicture.asset(Assets.imagesTrend)
              : SvgPicture.asset(Assets.imagesTag),
        ),
      ],
    );
  }
}
